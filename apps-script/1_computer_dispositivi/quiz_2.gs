/**
 * Computer e dispositivi - Quiz 2.
 * 25 domande: 8 facili, 9 medie, 8 difficili.
 * 20 scelte singole e 5 risposte multiple. Totale: 25 punti.
 *
 * Incolla questo file in Apps Script ed esegui creaQuizComputer2.
 * Il modulo viene creato in bozza: aprilo dal link nel registro e premi
 * Pubblica quando vuoi condividerlo. Non occorrono librerie o altri file.
 * Una nuova esecuzione restituisce il modulo già completato nello stesso progetto.
 *
 * API: https://developers.google.com/apps-script/reference/forms
 */
function creaQuizComputer2() {
  const titolo = "Computer e dispositivi - Quiz 2";
  const distribuzione = {"facile": 8, "media": 9, "difficile": 8};
  const chiave = "icdl_computer_dispositivi_quiz_2_v1";
  // Per ottenere una nuova copia, cambia la chiave (per esempio v1 in v2).
  const domande = [
    {
      "id": "M1-087",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Perché installare una suite per ufficio non sostituisce il sistema operativo?",
      "opzioni": [
        "Suite e sistema operativo sono due nomi per lo stesso tipo di programma.",
        "Il sistema operativo serve soltanto a installare la suite e poi non interviene.",
        "La suite gestisce da sola tutte le risorse e rende superfluo il sistema operativo.",
        "La suite svolge compiti dell’utente, mentre il sistema operativo gestisce le risorse che la fanno funzionare."
      ],
      "corrette": [
        3
      ],
      "spiegazione": "Software applicativo e software di base hanno ruoli diversi e complementari."
    },
    {
      "id": "M1-074",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Prepari una relazione, la salvi e la invii al docente. Quale descrizione collega queste azioni all’ICT?",
      "opzioni": [
        "Usi la rete senza utilizzare alcun software.",
        "Modifichi le caratteristiche fisiche del computer.",
        "Elabori, conservi e scambi informazioni con strumenti digitali.",
        "Svolgi soltanto un trasferimento di alimentazione tra dispositivi."
      ],
      "corrette": [
        2
      ],
      "spiegazione": "Le diverse fasi mostrano più funzioni dell’ICT nello stesso lavoro."
    },
    {
      "id": "M1-059",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Scarichi la versione Windows di un programma e vuoi usarla su Android. Che cosa devi verificare?",
      "opzioni": [
        "Se basta rinominare il file con il nome del telefono.",
        "Se il telefono ha più spazio del computer, perché questo garantisce la compatibilità.",
        "Se esiste una versione o una soluzione compatibile con Android.",
        "Se il programma è gratuito, perché questo lo rende compatibile."
      ],
      "corrette": [
        2
      ],
      "spiegazione": "Prezzo e spazio disponibile non garantiscono la compatibilità con il sistema operativo."
    },
    {
      "id": "M1-060",
      "livello": "media",
      "tipo": "multipla",
      "domanda": "Quali informazioni sono utili per capire se un’applicazione è adatta a lavorare durante un viaggio senza connessione?",
      "opzioni": [
        "Se dispone di funzioni utilizzabili offline.",
        "Il numero di lettere nel nome del programma.",
        "Se è installata sul dispositivo e quali funzioni richiedono Internet.",
        "Se la sua icona ha lo stesso colore dello sfondo."
      ],
      "corrette": [
        0,
        2
      ],
      "spiegazione": "Bisogna verificare le funzioni offline e i requisiti di connessione, senza dedurli dal solo aspetto dell’app."
    },
    {
      "id": "M1-091",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Un’impresa vuole usare un programma open source. Qual è la valutazione corretta?",
      "opzioni": [
        "Il programma diventa proprietario appena viene usato da un’impresa.",
        "L’uso commerciale è escluso dalla definizione di open source.",
        "L’uso commerciale è possibile, rispettando le condizioni della licenza.",
        "L’impresa può ignorare la licenza perché il codice è accessibile."
      ],
      "corrette": [
        2
      ],
      "spiegazione": "Open source non significa divieto di uso commerciale né assenza di condizioni."
    },
    {
      "id": "M1-085",
      "livello": "difficile",
      "tipo": "multipla",
      "domanda": "Quali associazioni tra situazione e azione sono corrette?",
      "opzioni": [
        "Ho finito e il computer serve ad altri: salvo e mi disconnetto.",
        "Mi allontano per poco e voglio mantenere aperti i programmi: blocco la sessione.",
        "Voglio proteggere la sessione: spengo soltanto il monitor.",
        "Voglio lasciare i programmi aperti: mi disconnetto senza salvare."
      ],
      "corrette": [
        0,
        1
      ],
      "spiegazione": "Blocco e disconnessione rispondono a esigenze diverse; il monitor spento non protegge l’account."
    },
    {
      "id": "M1-097",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Un compagno dice: «Nel modello di Von Neumann la memoria contiene i dati, quindi non può contenere anche il programma». Qual è la correzione?",
      "opzioni": [
        "La memoria comune mantiene sia i dati sia le istruzioni che la CPU deve eseguire.",
        "Il programma è un componente del case, quindi non occupa memoria.",
        "I dati e i programmi sono la stessa cosa e non hanno ruoli distinguibili.",
        "Le istruzioni vengono conservate soltanto nello schermo che mostra il risultato."
      ],
      "corrette": [
        0
      ],
      "spiegazione": "Dati e istruzioni hanno ruoli diversi, ma nel modello possono essere mantenuti nella stessa memoria."
    },
    {
      "id": "M1-068",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Esci dalla posta elettronica nel browser. Sei uscito anche dall’account Windows?",
      "opzioni": [
        "Sì, se la posta è stata aperta prima degli altri programmi.",
        "No, perché un account Windows non può essere disconnesso.",
        "Sì, perché il browser gestisce ogni accesso al computer.",
        "No, l’uscita dal sito e quella dall’account del computer sono operazioni diverse."
      ],
      "corrette": [
        3
      ],
      "spiegazione": "Per terminare la sessione del computer occorre il comando di disconnessione del sistema operativo."
    },
    {
      "id": "M1-002",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Dobbiamo organizzare una gita e confrontare i costi di trasporto. Quale strumento è più adatto?",
      "opzioni": [
        "Un lettore multimediale con cui riprodurre la presentazione della gita.",
        "Un programma di messaggistica in cui inviare una foto dei biglietti.",
        "Un programma di disegno in cui rappresentare il percorso.",
        "Un foglio elettronico in cui inserire i costi e fare i calcoli."
      ],
      "corrette": [
        3
      ],
      "spiegazione": "Il foglio elettronico è uno strumento di produttività adatto a organizzare dati e fare calcoli."
    },
    {
      "id": "M1-100",
      "livello": "difficile",
      "tipo": "multipla",
      "domanda": "Devi scegliere un programma per lavorare sul computer della scuola. Quali verifiche sono pertinenti?",
      "opzioni": [
        "Condizioni della licenza e requisiti di connessione.",
        "Compatibilità con sistema operativo e dispositivo.",
        "Colore dell’icona uguale a quello del desktop.",
        "Funzioni adatte al compito da svolgere."
      ],
      "corrette": [
        0,
        1,
        3
      ],
      "spiegazione": "Una scelta adatta richiede sia compatibilità tecnica sia condizioni d’uso e modalità operative adeguate."
    },
    {
      "id": "M1-094",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Per un progetto devi montare un video senza connessione. Quale criterio unisce correttamente compito e modalità di utilizzo?",
      "opzioni": [
        "Scegliere un’app in base al prezzo senza controllarne funzioni e connessione.",
        "Scegliere un programma locale di scrittura perché la modalità offline basta per qualsiasi compito.",
        "Scegliere un’app di montaggio solo online perché il tipo di contenuto è corretto.",
        "Scegliere un’applicazione di montaggio con le funzioni necessarie utilizzabili offline."
      ],
      "corrette": [
        3
      ],
      "spiegazione": "Servono sia strumenti adatti al contenuto sia una modalità di lavoro compatibile con la connessione disponibile."
    },
    {
      "id": "M1-003",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Quale attività è un esempio di utilizzo delle tecnologie mobili?",
      "opzioni": [
        "Stampare una relazione dal computer del laboratorio.",
        "Montare un disco interno nel computer della scuola.",
        "Collegare una tastiera al computer fisso della classe.",
        "Consultare una mappa sullo smartphone durante un viaggio."
      ],
      "corrette": [
        3
      ],
      "spiegazione": "Lo smartphone permette di consultare servizi e informazioni anche mentre ci spostiamo."
    },
    {
      "id": "M1-063",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Un programma è gratuito, ma il suo codice non è disponibile per la modifica. Quale conclusione è corretta?",
      "opzioni": [
        "Può essere freeware e proprietario.",
        "Può essere soltanto un sistema operativo.",
        "Deve essere open source perché è gratuito.",
        "Non può avere una licenza."
      ],
      "corrette": [
        0
      ],
      "spiegazione": "Un software gratuito può essere proprietario: prezzo e disponibilità del codice sono aspetti distinti."
    },
    {
      "id": "M1-040",
      "livello": "facile",
      "tipo": "multipla",
      "domanda": "Quali diritti può concedere una licenza open source, nel rispetto delle sue condizioni?",
      "opzioni": [
        "Modificare il codice sorgente.",
        "Usare il software soltanto per attività non commerciali.",
        "Ignorare le condizioni della licenza.",
        "Ridistribuire il software."
      ],
      "corrette": [
        0,
        3
      ],
      "spiegazione": "L’open source permette accesso al codice, uso, modifica e ridistribuzione secondo la licenza."
    },
    {
      "id": "M1-058",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Apri un programma di scrittura e lavori a una relazione. Quale descrizione distingue correttamente i ruoli?",
      "opzioni": [
        "L’applicazione permette di scrivere; il sistema operativo gestisce le risorse necessarie.",
        "Il sistema operativo serve soltanto prima dell’apertura dell’applicazione.",
        "Il sistema operativo scrive la relazione; l’applicazione alimenta il computer.",
        "L’applicazione sostituisce la RAM; il sistema operativo conserva i fogli stampati."
      ],
      "corrette": [
        0
      ],
      "spiegazione": "Il sistema operativo continua a fornire servizi alle applicazioni durante l’esecuzione."
    },
    {
      "id": "M1-052",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Nell’analogia tra bancone e magazzino, quale associazione descrive RAM e memoria di massa?",
      "opzioni": [
        "RAM come magazzino; CPU come scaffale per conservare documenti.",
        "RAM e memoria di massa come due nomi dello stesso bancone.",
        "RAM come magazzino; memoria di massa come bancone di lavoro.",
        "RAM come bancone di lavoro; memoria di massa come magazzino."
      ],
      "corrette": [
        3
      ],
      "spiegazione": "La RAM contiene ciò che si sta usando; la memoria di massa conserva file e programmi."
    },
    {
      "id": "M1-005",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Devi lavorare allo stesso documento in classe e a casa. Quale caratteristica di un portatile facilita questo utilizzo?",
      "opzioni": [
        "Assenza di un sistema operativo da avviare.",
        "Possibilità di conservare i documenti soltanto nella RAM.",
        "Necessità di essere utilizzato su una sola scrivania.",
        "Dimensioni adatte al trasporto e batteria ricaricabile."
      ],
      "corrette": [
        3
      ],
      "spiegazione": "I portatili sono progettati per essere trasportati e utilizzati anche grazie alla batteria."
    },
    {
      "id": "M1-065",
      "livello": "media",
      "tipo": "multipla",
      "domanda": "Una scuola vuole adattare un programma alle proprie esigenze. Quali caratteristiche dell’open source sono pertinenti?",
      "opzioni": [
        "Divieto di usarlo in attività commerciali.",
        "Assenza di qualunque condizione di ridistribuzione.",
        "Accesso al codice sorgente.",
        "Possibilità di modificarlo rispettando la licenza."
      ],
      "corrette": [
        2,
        3
      ],
      "spiegazione": "Le modifiche sono consentite dalla licenza open source, che continua a prevedere condizioni."
    },
    {
      "id": "M1-018",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Il computer rallenta quando tieni aperte molte applicazioni. Quale situazione può contribuire al problema?",
      "opzioni": [
        "Il computer ha una webcam integrata.",
        "La tastiera è collegata tramite USB invece di essere integrata.",
        "La RAM non è sufficiente per i dati e i programmi in uso.",
        "Il monitor è collegato a una porta HDMI."
      ],
      "corrette": [
        2
      ],
      "spiegazione": "La quantità di RAM può limitare il lavoro con più applicazioni aperte; non è l’unica possibile causa di un rallentamento."
    },
    {
      "id": "M1-020",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Vuoi ottenere su carta una relazione già presente nel computer. Quale periferica utilizzi?",
      "opzioni": [
        "Il trackpad.",
        "La stampante.",
        "Il microfono.",
        "Lo scanner."
      ],
      "corrette": [
        1
      ],
      "spiegazione": "La stampante è una periferica di output: produce una copia su carta."
    },
    {
      "id": "M1-077",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Il computer A ha più GHz; il B ha più RAM e un SSD. Quale conclusione è sostenibile senza altre informazioni?",
      "opzioni": [
        "Bisogna valutare il tipo di lavoro e l’insieme dei componenti.",
        "B è più veloce in ogni attività perché la quantità di RAM decide tutte le prestazioni.",
        "La capacità totale del disco basta per decidere, senza considerare CPU e RAM.",
        "A è più veloce in ogni attività perché il clock decide tutte le prestazioni."
      ],
      "corrette": [
        0
      ],
      "spiegazione": "Nessun singolo dato basta a stabilire una superiorità in qualsiasi compito."
    },
    {
      "id": "M1-054",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Un computer ha molto spazio libero sul disco, ma poca RAM e tante applicazioni aperte. Perché lo spazio libero non basta a evitare rallentamenti?",
      "opzioni": [
        "Un disco con spazio libero trasforma le applicazioni in servizi online.",
        "Lo spazio libero sul disco impedisce al processore di eseguire istruzioni.",
        "La RAM serve a conservare i file e non riguarda le applicazioni aperte.",
        "La capacità di archiviazione e la memoria di lavoro svolgono funzioni diverse."
      ],
      "corrette": [
        3
      ],
      "spiegazione": "Avere spazio per i file non significa avere abbastanza RAM per lavorare con molti programmi."
    },
    {
      "id": "M1-079",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Un dispositivo mostra un modulo e riceve le risposte toccando lo schermo. Perché sarebbe incompleto classificarlo soltanto come output?",
      "opzioni": [
        "Perché il modulo rende il dispositivo una memoria secondaria.",
        "Perché ricevere i tocchi è anche una funzione di input.",
        "Perché uno schermo non può mostrare informazioni.",
        "Perché qualsiasi periferica esterna è soltanto input."
      ],
      "corrette": [
        1
      ],
      "spiegazione": "La classificazione considera ciò che il dispositivo fa: mostrare risultati e ricevere comandi."
    },
    {
      "id": "M1-014",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Scrivi una relazione e vuoi ritrovarla dopo aver spento il computer. Che cosa devi fare?",
      "opzioni": [
        "Lasciare il testo aperto nella RAM e spegnere il computer.",
        "Aumentare la frequenza di clock prima di chiudere il documento.",
        "Ridurre a icona il programma prima di togliere l’alimentazione.",
        "Salvarla in un file sulla memoria di massa, per esempio sull’SSD."
      ],
      "corrette": [
        3
      ],
      "spiegazione": "Il salvataggio conserva il documento nella memoria non volatile, come un HDD o un SSD."
    },
    {
      "id": "M1-011",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Che cosa indica l’espressione «processore quad core»?",
      "opzioni": [
        "Un computer al quale si possono collegare quattro periferiche.",
        "Un computer con quattro sistemi operativi installati.",
        "Una CPU con quattro gigabyte di memoria per salvare i file.",
        "Una CPU con quattro unità di elaborazione interne."
      ],
      "corrette": [
        3
      ],
      "spiegazione": "Un core è un’unità di elaborazione interna alla CPU. Quad core significa quattro core."
    }
  ];

  // Il controllo avviene prima di creare file nel tuo account.
  if (domande.length !== 25) {
    throw new Error("Il quiz deve contenere esattamente 25 domande.");
  }
  const conteggi = { facile: 0, media: 0, difficile: 0 };
  const identificatori = new Set();
  let multiple = 0;
  domande.forEach(function (domanda) {
    if (identificatori.has(domanda.id)) {
      throw new Error("Domanda duplicata: " + domanda.id);
    }
    identificatori.add(domanda.id);
    if (!Object.prototype.hasOwnProperty.call(conteggi, domanda.livello)) {
      throw new Error("Difficoltà non valida: " + domanda.id);
    }
    conteggi[domanda.livello]++;
    const risposte = domanda.corrette;
    if (!domanda.domanda || !domanda.spiegazione ||
        domanda.opzioni.length !== 4 ||
        new Set(domanda.opzioni).size !== 4 ||
        domanda.opzioni.some(function (testo) { return !testo.trim(); }) ||
        risposte.length < 1 || risposte.length > 3 ||
        new Set(risposte).size !== risposte.length ||
        risposte.some(function (i) { return !Number.isInteger(i) || i < 0 || i > 3; }) ||
        (domanda.tipo !== "singola" && domanda.tipo !== "multipla") ||
        (domanda.tipo === "singola" && risposte.length !== 1) ||
        (domanda.tipo === "multipla" && risposte.length < 2)) {
      throw new Error("Opzioni o soluzione non valide: " + domanda.id);
    }
    if (domanda.tipo === "multipla") multiple++;
  });
  Object.keys(distribuzione).forEach(function (livello) {
    if (conteggi[livello] !== distribuzione[livello]) {
      throw new Error("Distribuzione delle difficoltà non valida.");
    }
  });
  if (multiple !== 5) throw new Error("Sono previste 5 risposte multiple.");

  const lock = LockService.getScriptLock();
  lock.waitLock(30000);
  try {
    const proprieta = PropertiesService.getScriptProperties();
    const esistente = proprieta.getProperty(chiave);
    if (esistente) {
      const modulo = FormApp.openById(esistente);
      return mostraLink(modulo, "Modulo già creato");
    }

    const modulo = FormApp.create(titolo, false);
    // Il link rimane nel registro anche in caso di interruzione della creazione.
    console.log("Bozza in costruzione: " + modulo.getEditUrl());
    modulo.setIsQuiz(true)
      .setDescription(
        "Rispondi alle 25 domande. Ogni domanda vale 1 punto, per un totale di 25. " +
        "Nelle domande a scelta singola scegli una sola risposta; " +
        "nelle domande a risposta multipla seleziona tutte le risposte corrette."
      )
      .setConfirmationMessage("Risposte inviate. Grazie per il lavoro!")
      .setShuffleQuestions(true)
      .setCollectEmail(false)
      .setLimitOneResponsePerUser(false)
      .setPublishingSummary(false)
      .setShowLinkToRespondAgain(false);

    domande.forEach(function (domanda) {
      const elemento = domanda.tipo === "multipla"
        ? modulo.addCheckboxItem()
        : modulo.addMultipleChoiceItem();
      elemento.setTitle(domanda.domanda)
        .setHelpText(domanda.tipo === "multipla"
          ? "Seleziona tutte le risposte corrette."
          : "Scegli una sola risposta.")
        .setRequired(true)
        .setPoints(1);
      elemento.setChoices(domanda.opzioni.map(function (testo, indice) {
        return elemento.createChoice(testo, domanda.corrette.indexOf(indice) !== -1);
      }));
      const feedback = FormApp.createFeedback()
        .setText(domanda.spiegazione)
        .build();
      elemento.setFeedbackForCorrect(feedback);
      elemento.setFeedbackForIncorrect(feedback);
    });

    // L'ID si salva dopo il completamento: una nuova esecuzione non duplica il quiz.
    proprieta.setProperty(chiave, modulo.getId());
    return mostraLink(modulo, "Modulo creato in bozza");
  } finally {
    lock.releaseLock();
  }

  function mostraLink(modulo, messaggio) {
    const risultato = {
      id: modulo.getId(),
      modifica: modulo.getEditUrl(),
      compilazione: modulo.getPublishedUrl()
    };
    console.log(messaggio + ": " + titolo);
    console.log("Modifica: " + risultato.modifica);
    console.log("Compilazione (utilizzabile dopo Pubblica): " + risultato.compilazione);
    return risultato;
  }
}
