/**
 * Computer e dispositivi - Quiz 3.
 * 25 domande: 8 facili, 8 medie, 9 difficili.
 * 20 scelte singole e 5 risposte multiple. Totale: 25 punti.
 *
 * Incolla questo file in Apps Script ed esegui creaQuizComputer3.
 * Il modulo viene creato in bozza: aprilo dal link nel registro e premi
 * Pubblica quando vuoi condividerlo. Non occorrono librerie o altri file.
 * Una nuova esecuzione restituisce il modulo già completato nello stesso progetto.
 *
 * API: https://developers.google.com/apps-script/reference/forms
 */
function creaQuizComputer3() {
  const titolo = "Computer e dispositivi - Quiz 3";
  const distribuzione = {"facile": 8, "media": 8, "difficile": 9};
  const chiave = "icdl_computer_dispositivi_quiz_3_v1";
  // Per ottenere una nuova copia, cambia la chiave (per esempio v1 in v2).
  const domande = [
    {
      "id": "M1-089",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Lo stesso computer viene usato prima per scrivere e poi per montare un video, senza cambiare i componenti fisici. Che cosa spiega il cambiamento di attività?",
      "opzioni": [
        "Vengono eseguite istruzioni di programmi diversi sullo stesso hardware.",
        "Un programma di scrittura diventa fisicamente un processore video.",
        "Il computer deve aver sostituito automaticamente la propria scheda madre.",
        "Il case determina il compito e cambia funzione quando viene spostato."
      ],
      "corrette": [
        0
      ],
      "spiegazione": "La macchina è programmabile: il software definisce il lavoro svolto, entro le capacità dell’hardware."
    },
    {
      "id": "M1-090",
      "livello": "difficile",
      "tipo": "multipla",
      "domanda": "Quali conclusioni sulle prestazioni sono ragionevoli?",
      "opzioni": [
        "Più spazio sul disco garantisce automaticamente più velocità in ogni programma.",
        "Un SSD può ridurre i tempi di avvio rispetto a un HDD.",
        "RAM insufficiente può rendere difficile lavorare con molte applicazioni.",
        "Il numero di GHz descrive da solo ogni prestazione del computer."
      ],
      "corrette": [
        1,
        2
      ],
      "spiegazione": "Le prestazioni dipendono dal lavoro e dall’interazione di più componenti."
    },
    {
      "id": "M1-022",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Che cosa significa dire che i computer sono macchine universali?",
      "opzioni": [
        "Tutte le loro componenti hanno la stessa funzione.",
        "Possono svolgere compiti diversi seguendo programmi diversi.",
        "Ogni computer esegue un solo compito deciso dal case.",
        "Qualsiasi programma funziona su qualsiasi sistema operativo."
      ],
      "corrette": [
        1
      ],
      "spiegazione": "Il software dà al computer un comportamento e uno scopo; la stessa macchina può svolgere attività diverse."
    },
    {
      "id": "M1-043",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Quale descrizione corrisponde allo shareware?",
      "opzioni": [
        "Software che può essere eseguito soltanto online.",
        "Software distribuito per essere provato e condiviso, con un pagamento per proseguire secondo le condizioni previste.",
        "Software destinato esclusivamente a gestire le periferiche.",
        "Software che si può modificare liberamente perché non ha licenza."
      ],
      "corrette": [
        1
      ],
      "spiegazione": "La possibilità di provare o condividere lo shareware non elimina le condizioni della licenza."
    },
    {
      "id": "M1-039",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Qual è il ruolo della scheda madre?",
      "opzioni": [
        "Raccogliere e collegare tra loro i componenti principali.",
        "Conservare i documenti come una memoria di massa.",
        "Mostrare i risultati come uno schermo.",
        "Proteggere dall’esterno i componenti come il case."
      ],
      "corrette": [
        0
      ],
      "spiegazione": "La scheda madre è la piastra che collega i componenti principali attraverso collegamenti stampati."
    },
    {
      "id": "M1-066",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Ti allontani per pochi minuti e vuoi ritrovare i programmi aperti senza lasciare accessibile la sessione. Che cosa fai?",
      "opzioni": [
        "Blocchi la sessione.",
        "Comunichi la password a un compagno.",
        "Chiudi soltanto il sito aperto nel browser.",
        "Spegni soltanto il monitor."
      ],
      "corrette": [
        0
      ],
      "spiegazione": "Il blocco protegge temporaneamente la sessione mantenendo aperti i programmi."
    },
    {
      "id": "M1-061",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Devi togliere una parte iniziale da una registrazione audio. Quale applicazione cerchi?",
      "opzioni": [
        "Uno strumento per gestire gli account.",
        "Un programma per modificare tracce audio.",
        "Un foglio elettronico.",
        "Un programma CAD."
      ],
      "corrette": [
        1
      ],
      "spiegazione": "Il compito riguarda l’elaborazione multimediale, in particolare l’audio."
    },
    {
      "id": "M1-056",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Devi collegare una chiavetta e proiettare una presentazione. Quale abbinamento è adatto?",
      "opzioni": [
        "USB per la chiavetta; uscita audio per trasmettere anche le immagini.",
        "Ingresso microfono per la chiavetta; HDMI per il proiettore.",
        "HDMI per la chiavetta; USB per qualsiasi proiettore senza verifiche.",
        "USB per la chiavetta; HDMI per il proiettore."
      ],
      "corrette": [
        3
      ],
      "spiegazione": "USB collega periferiche come le chiavette; HDMI trasmette audio e video digitali."
    },
    {
      "id": "M1-036",
      "livello": "facile",
      "tipo": "multipla",
      "domanda": "Quali affermazioni sul software locale e online sono corrette?",
      "opzioni": [
        "Un programma locale è installato sul dispositivo.",
        "Ogni programma locale funziona senza Internet in tutte le sue funzioni.",
        "Un’applicazione online si usa attraverso Internet, spesso dal browser.",
        "Usare un’applicazione online richiede sempre di installarla interamente."
      ],
      "corrette": [
        0,
        2
      ],
      "spiegazione": "Locale e online indicano modalità di utilizzo; alcuni programmi le combinano."
    },
    {
      "id": "M1-001",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Che cosa comprende l’ICT?",
      "opzioni": [
        "I collegamenti che permettono di alimentare i dispositivi elettronici.",
        "Le tecnologie per raccogliere, elaborare, conservare e scambiare informazioni.",
        "I programmi che servono per scrivere documenti e fare calcoli.",
        "L’insieme delle parti fisiche contenute nel case di un computer."
      ],
      "corrette": [
        1
      ],
      "spiegazione": "L’ICT comprende dispositivi, programmi e reti che permettono di lavorare con le informazioni."
    },
    {
      "id": "M1-099",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Un’applicazione invia un documento alla stampante. Quale descrizione rispetta il ruolo del sistema operativo?",
      "opzioni": [
        "Il sistema operativo interviene soltanto dopo lo spegnimento.",
        "La stampante sostituisce il sistema operativo durante la stampa.",
        "L’applicazione usa i servizi del sistema operativo per utilizzare la periferica.",
        "L’applicazione deve diventare hardware prima di comunicare."
      ],
      "corrette": [
        2
      ],
      "spiegazione": "Le applicazioni svolgono i compiti dell’utente utilizzando strumenti e servizi del sistema operativo."
    },
    {
      "id": "M1-025",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Quale collegamento è adatto a una chiavetta di memoria USB?",
      "opzioni": [
        "Una porta USB.",
        "Una porta HDMI.",
        "Un’uscita per altoparlanti.",
        "Un connettore di alimentazione del monitor."
      ],
      "corrette": [
        0
      ],
      "spiegazione": "Le porte USB permettono di collegare periferiche e trasferire dati."
    },
    {
      "id": "M1-095",
      "livello": "difficile",
      "tipo": "multipla",
      "domanda": "Quali affermazioni tengono distinti funzione e collegamento di una periferica?",
      "opzioni": [
        "Una tastiera diventa software quando è integrata nel portatile.",
        "Un microfono esterno e uno integrato svolgono entrambi una funzione di input.",
        "Uno schermo che riceve il tocco può svolgere input e output.",
        "La docking station può raccogliere collegamenti a periferiche con funzioni diverse."
      ],
      "corrette": [
        1,
        2,
        3
      ],
      "spiegazione": "Input e output descrivono la funzione; integrata, esterna e modalità di collegamento descrivono altri aspetti."
    },
    {
      "id": "M1-086",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Perché «il computer ha un SSD» non è una buona ragione per spegnerlo senza salvare una modifica?",
      "opzioni": [
        "L’SSD conserva ciò che vi è stato salvato; una modifica ancora temporanea può andare persa.",
        "La presenza dell’SSD rende permanente anche il contenuto della RAM.",
        "Un documento è salvato se il programma che lo mostra è stato installato sull’SSD.",
        "Ogni modifica viene scritta sull’SSD appena compare sullo schermo, senza bisogno di salvataggio."
      ],
      "corrette": [
        0
      ],
      "spiegazione": "La non volatilità del supporto non equivale al salvataggio automatico di ogni modifica."
    },
    {
      "id": "M1-028",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Che cos’è un programma?",
      "opzioni": [
        "Un collegamento tra due periferiche.",
        "Un insieme di istruzioni eseguibili dal computer.",
        "Una componente fisica che conserva la corrente.",
        "Un contenitore per trasportare il computer."
      ],
      "corrette": [
        1
      ],
      "spiegazione": "Un programma contiene istruzioni per svolgere automaticamente un compito."
    },
    {
      "id": "M1-057",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Un portatile è collegato a monitor, rete, tastiera e mouse tramite una docking station. Perché è comoda quando devi portarlo a casa?",
      "opzioni": [
        "La docking station esegue il sistema operativo al posto del portatile.",
        "Puoi scollegare il collegamento al portatile senza staccare ogni periferica dalla base.",
        "Non devi più salvare i documenti prima di uscire.",
        "Le applicazioni diventano compatibili con qualsiasi sistema operativo."
      ],
      "corrette": [
        1
      ],
      "spiegazione": "La base raccoglie più collegamenti e semplifica il passaggio tra scrivania e utilizzo in mobilità."
    },
    {
      "id": "M1-093",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Un programma si può eseguire, ma la licenza non permette di modificarne liberamente il codice. Perché le due cose possono coesistere?",
      "opzioni": [
        "La possibilità di copiare il collegamento implica il diritto di ridistribuire il software.",
        "Eseguire un programma rende automaticamente modificabile e ridistribuibile il sorgente.",
        "Un programma gratuito deve necessariamente concedere la modifica del codice.",
        "Usare un programma e modificarne il sorgente sono diritti diversi."
      ],
      "corrette": [
        3
      ],
      "spiegazione": "La possibilità di eseguire il programma non implica il diritto di modificarlo e ridistribuirlo."
    },
    {
      "id": "M1-096",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Devi lasciare il computer acceso ma terminare il tuo lavoro personale. Perché Arresta il sistema non è l’azione più adatta?",
      "opzioni": [
        "Chiude soltanto i siti del browser.",
        "Mantiene sempre aperte tutte le applicazioni.",
        "Spegne il computer; per chiudere la sola sessione serve la disconnessione.",
        "Disabilita la tastiera ma lascia l’account accessibile."
      ],
      "corrette": [
        2
      ],
      "spiegazione": "La scelta dipende dall’obiettivo: terminare la propria sessione oppure spegnere l’intero computer."
    },
    {
      "id": "M1-064",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Un programma funziona gratuitamente per 30 giorni e poi richiede una licenza. Come interpreti questa offerta?",
      "opzioni": [
        "È freeware senza limiti di utilizzo.",
        "È necessariamente open source.",
        "È una versione di prova con un limite di tempo.",
        "È un’applicazione priva di condizioni di licenza."
      ],
      "corrette": [
        2
      ],
      "spiegazione": "La durata limitata è una caratteristica tipica di una versione trial."
    },
    {
      "id": "M1-032",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Che cosa bisogna controllare prima di installare un’applicazione?",
      "opzioni": [
        "Che sia stata scaricata usando uno smartphone.",
        "Che abbia lo stesso nome del computer.",
        "Che il computer non abbia altre applicazioni.",
        "Che sia compatibile con il dispositivo e il sistema operativo."
      ],
      "corrette": [
        3
      ],
      "spiegazione": "Le applicazioni devono essere adatte alla piattaforma sulla quale vengono eseguite."
    },
    {
      "id": "M1-070",
      "livello": "media",
      "tipo": "multipla",
      "domanda": "Quali affermazioni aiutano a distinguere RAM e SSD?",
      "opzioni": [
        "La RAM conserva i file senza alimentazione.",
        "Un file salvato sull’SSD resta memorizzato dopo lo spegnimento.",
        "L’SSD viene svuotato ogni volta che si chiude un’applicazione.",
        "I dati nella RAM sono temporanei."
      ],
      "corrette": [
        1,
        3
      ],
      "spiegazione": "RAM e SSD svolgono ruoli diversi e hanno un diverso comportamento dopo lo spegnimento."
    },
    {
      "id": "M1-069",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Perché la presenza di più core può aiutare un processore a gestire il lavoro?",
      "opzioni": [
        "I core eliminano la necessità del sistema operativo.",
        "Più unità di elaborazione possono svolgere operazioni contemporaneamente.",
        "Ogni core sostituisce una periferica di input.",
        "Ogni core conserva una copia permanente dei documenti."
      ],
      "corrette": [
        1
      ],
      "spiegazione": "Più core possono aumentare il lavoro eseguito in parallelo; le prestazioni dipendono anche da altri fattori."
    },
    {
      "id": "M1-078",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Durante una presentazione vuoi ridurre i tempi di caricamento dei file, a parità delle altre condizioni. Quale cambiamento riguarda direttamente questo obiettivo?",
      "opzioni": [
        "Aumentare le dimensioni del monitor.",
        "Passare da un HDD a un SSD.",
        "Scegliere il computer soltanto in base alla capacità totale del disco.",
        "Sostituire una tastiera esterna con una integrata."
      ],
      "corrette": [
        1
      ],
      "spiegazione": "Un SSD può ridurre i tempi di caricamento rispetto a un HDD; le altre proposte non garantiscono lo stesso risultato."
    },
    {
      "id": "M1-075",
      "livello": "media",
      "tipo": "multipla",
      "domanda": "Quali comportamenti sono corretti prima di lasciare il laboratorio?",
      "opzioni": [
        "Considerare il blocco equivalente allo spegnimento.",
        "Usare Arresta il sistema se è previsto lo spegnimento del computer.",
        "Salvare il lavoro prima di disconnettersi.",
        "Togliere la corrente come normale metodo per chiudere la sessione."
      ],
      "corrette": [
        1,
        2
      ],
      "spiegazione": "Disconnessione e spegnimento sono azioni diverse; in entrambi i casi il lavoro va prima salvato."
    },
    {
      "id": "M1-082",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Due programmi sono gratuiti, ma uno è freeware proprietario e l’altro open source. Perché non possiamo attribuire loro automaticamente gli stessi diritti di modifica?",
      "opzioni": [
        "La possibilità di eseguire i due programmi implica uguali diritti di ridistribuzione.",
        "La gratuità rende modificabile qualsiasi codice sorgente.",
        "Il prezzo è uguale, ma i diritti dipendono dalle rispettive licenze.",
        "Il programma con più funzioni concede necessariamente più diritti sul sorgente."
      ],
      "corrette": [
        2
      ],
      "spiegazione": "Gratuito descrive il costo; la licenza stabilisce accesso al codice e diritti di modifica e distribuzione."
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
