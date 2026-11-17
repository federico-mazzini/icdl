const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');
const folder = path.join(root, 'apps-script/1_computer_dispositivi');
const sources = [1, 2, 3, 4].map(n =>
  fs.readFileSync(path.join(folder, 'quiz_' + n + '.gs'), 'utf8'));

function poolFromMarkdown() {
  const source = fs.readFileSync(path.join(root, 'domande/1_computer_dispositivi.md'), 'utf8');
  const [body, solutions] = source.split('## Soluzioni\n');
  const keys = new Map([...solutions.matchAll(/^\| (M1-\d{3}) \| ([A-D](?:, [A-D])*) \| (.+) \|$/gm)]
    .map(m => [m[1], { letters: m[2].split(', '), explanation: m[3] }]));
  const blocks = body.split(/^### (M1-\d{3})\s*$/m);
  const pool = new Map();
  for (let i = 1; i < blocks.length; i += 2) {
    const [id, content] = blocks.slice(i, i + 2);
    const number = Number(id.slice(-3));
    const options = new Map([...content.matchAll(/^- ([A-D])\) (.+)$/gm)].map(m => [m[1], m[2]]));
    const key = keys.get(id);
    pool.set(content.trim().split('\n\n')[0], {
      id,
      level: number <= 50 ? 'facile' : number <= 75 ? 'media' : 'difficile',
      correct: key.letters.map(letter => options.get(letter)).sort(),
      options: [...options.values()].sort(),
      explanation: key.explanation
    });
  }
  assert.equal(pool.size, 100);
  return pool;
}

function runtime() {
  const state = { forms: [], properties: new Map(), logs: [], locked: false, failAt: null };
  class Item {
    constructor(kind) { this.kind = kind; }
    setTitle(value) { this.title = value; return this; }
    setHelpText(value) { this.help = value; return this; }
    setRequired(value) { this.required = value; return this; }
    setPoints(value) { this.points = value; return this; }
    setChoices(value) { this.choices = value; return this; }
    createChoice(text, correct) {
      assert.equal(typeof correct, 'boolean');
      return { text, correct };
    }
    setFeedbackForCorrect(value) { this.feedbackCorrect = value; return this; }
    setFeedbackForIncorrect(value) { this.feedbackIncorrect = value; return this; }
  }
  class Form {
    constructor(title, published) {
      this.title = title;
      this.published = published;
      this.id = 'form-' + (state.forms.length + 1);
      this.items = [];
      this.settings = {};
    }
    getId() { return this.id; }
    getEditUrl() { return 'https://docs.google.com/forms/d/' + this.id + '/edit'; }
    getPublishedUrl() { return 'https://docs.google.com/forms/d/e/' + this.id + '/viewform'; }
    add(kind) {
      if (state.failAt === this.items.length) throw new Error('Errore API simulato');
      const item = new Item(kind);
      this.items.push(item);
      return item;
    }
    addCheckboxItem() { return this.add('multipla'); }
    addMultipleChoiceItem() { return this.add('singola'); }
  }
  for (const method of ['setIsQuiz', 'setDescription', 'setConfirmationMessage',
    'setShuffleQuestions', 'setCollectEmail', 'setLimitOneResponsePerUser',
    'setPublishingSummary', 'setShowLinkToRespondAgain']) {
    Form.prototype[method] = function (value) {
      this.settings[method] = value;
      return this;
    };
  }
  const context = vm.createContext({
    console: { log: value => state.logs.push(value) },
    PropertiesService: {
      getScriptProperties: () => ({
        getProperty: key => state.properties.get(key) || null,
        setProperty: (key, value) => { state.properties.set(key, value); }
      })
    },
    LockService: {
      getScriptLock: () => ({
        waitLock: () => {
          assert.equal(state.locked, false);
          state.locked = true;
        },
        releaseLock: () => { state.locked = false; }
      })
    },
    FormApp: {
      create(title, published) {
        assert.equal(state.locked, true);
        const form = new Form(title, published);
        state.forms.push(form);
        return form;
      },
      openById: id => {
        const form = state.forms.find(form => form.id === id);
        if (!form) throw new Error('Modulo non trovato');
        return form;
      },
      createFeedback: () => ({
        setText(value) { this.text = value; return this; },
        build() { return { text: this.text }; }
      })
    }
  });
  return { context, state };
}

test('quattro script indipendenti, 25 quesiti valutabili ciascuno e difficoltà bilanciate', () => {
  const pool = poolFromMarkdown();
  const expectedQuotas = [
    { facile: 9, media: 8, difficile: 8 },
    { facile: 8, media: 9, difficile: 8 },
    { facile: 8, media: 8, difficile: 9 },
    { facile: 9, media: 8, difficile: 8 }
  ];
  const occurrences = new Map();
  sources.forEach((source, index) => {
    const { context, state } = runtime();
    vm.runInContext(source, context);
    const run = context['creaQuizComputer' + (index + 1)];
    const result = run();
    assert.equal(state.forms.length, 1);
    const form = state.forms[0];
    assert.equal(result.id, form.id);
    assert.equal(form.items.length, 25);
    assert.equal(form.published, false);
    assert.equal(form.settings.setIsQuiz, true);
    assert.equal(form.settings.setShuffleQuestions, true);
    assert.equal(form.settings.setPublishingSummary, false);
    assert.equal(form.items.reduce((sum, item) => sum + item.points, 0), 25);
    const quotas = { facile: 0, media: 0, difficile: 0 };
    const ids = new Set();
    let multiple = 0;
    for (const item of form.items) {
      const expected = pool.get(item.title);
      assert.ok(expected, 'Il testo proviene dal pool');
      assert.equal(ids.has(expected.id), false, 'Nessuna ripetizione interna');
      ids.add(expected.id);
      occurrences.set(expected.id, (occurrences.get(expected.id) || 0) + 1);
      quotas[expected.level]++;
      assert.deepEqual(Array.from(item.choices, c => c.text).sort(), expected.options);
      assert.deepEqual(Array.from(item.choices).filter(c => c.correct).map(c => c.text).sort(), expected.correct);
      assert.equal(item.feedbackCorrect.text, expected.explanation);
      assert.equal(item.feedbackIncorrect.text, expected.explanation);
      assert.equal(item.required, true);
      assert.equal(item.points, 1);
      assert.equal(item.kind === 'multipla', expected.correct.length > 1);
      assert.match(item.help, item.kind === 'multipla' ? /tutte le risposte/ : /una sola/);
      if (item.kind === 'multipla') multiple++;
      assert.doesNotMatch(item.title, /slide|M1-\d{3}/i);
    }
    assert.deepEqual(quotas, expectedQuotas[index]);
    assert.equal(multiple, 5);
    assert.equal(state.locked, false);

    const secondResult = run();
    assert.equal(secondResult.id, result.id);
    assert.equal(state.forms.length, 1, 'Rieseguire non crea un duplicato');
    assert.equal(form.items.length, 25);
    assert.equal(state.locked, false);
  });
  assert.equal(occurrences.size, 84);
  assert.equal([...occurrences.values()].filter(n => n === 2).length, 16);
  assert.equal(Math.max(...occurrences.values()), 2);
  for (const entry of pool.values()) {
    if (entry.level !== 'facile') assert.ok(occurrences.has(entry.id));
  }
});

test('i quattro file possono convivere nello stesso progetto Apps Script', () => {
  const { context, state } = runtime();
  sources.forEach(source => vm.runInContext(source, context));
  for (let n = 1; n <= 4; n++) context['creaQuizComputer' + n]();
  assert.equal(state.forms.length, 4);
  assert.equal(state.properties.size, 4);
  for (let n = 1; n <= 4; n++) context['creaQuizComputer' + n]();
  assert.equal(state.forms.length, 4);
});

test('chiavi non valide vengono rifiutate prima di creare un modulo', () => {
  const { context, state } = runtime();
  const corrupted = sources[0].replace(/"corrette": \[\s*[0-3]/, '"corrette": [\n    -1');
  assert.notEqual(corrupted, sources[0]);
  vm.runInContext(corrupted, context);
  assert.throws(() => context.creaQuizComputer1(), /Opzioni o soluzione non valide/);
  assert.equal(state.forms.length, 0);
});

test('un errore API non salva un quiz incompleto come completato e rilascia il lock', () => {
  const { context, state } = runtime();
  vm.runInContext(sources[0], context);
  state.failAt = 5;
  assert.throws(() => context.creaQuizComputer1(), /Errore API simulato/);
  assert.equal(state.locked, false);
  assert.equal(state.properties.size, 0);
  assert.equal(state.forms[0].published, false);
  assert.ok(state.logs.some(line => line.includes(state.forms[0].getEditUrl())));
});
