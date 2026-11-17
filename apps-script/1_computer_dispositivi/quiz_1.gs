/**
 * Computer e dispositivi - Quiz 1.
 * 25 domande: 9 facili, 8 medie, 8 difficili.
 * 20 scelte singole e 5 risposte multiple. Totale: 25 punti.
 *
 * Incolla questo file in Apps Script ed esegui creaQuizComputer1.
 * Il modulo viene creato in bozza: aprilo dal link nel registro e premi
 * Pubblica quando vuoi condividerlo. Non occorrono librerie o altri file.
 * Una nuova esecuzione restituisce il modulo già completato nello stesso progetto.
 *
 * API: https://developers.google.com/apps-script/reference/forms
 */
function creaQuizComputer1() {
  const titolo = "Computer e dispositivi - Quiz 1";
  const distribuzione = {"facile": 9, "media": 8, "difficile": 8};
  const chiave = "icdl_computer_dispositivi_quiz_1_v1";
  // Per ottenere una nuova copia, cambia la chiave (per esempio v1 in v2).
  const domande = [
    {
      "id": "M1-062",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Hai scaricato legalmente un programma. Questo ti autorizza automaticamente a installarlo su tutti i computer della scuola?",
      "opzioni": [
        "No, bisogna controllare quanti dispositivi ammette la licenza.",
        "Sì, se tutti i computer hanno lo stesso sistema operativo.",
        "No, perché un programma scaricato non può essere installato.",
        "Sì, perché scaricare equivale ad acquistare ogni diritto sul programma."
      ],
      "corrette": [
        0
      ],
      "spiegazione": "Possedere una copia non elimina i limiti stabiliti dalla licenza."
    },
    {
      "id": "M1-071",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Devi portare nel computer il contenuto di un foglio e poi stamparne una copia. Quale sequenza di periferiche è adatta?",
      "opzioni": [
        "Stampante per acquisire, scanner per produrre la copia.",
        "Altoparlanti per acquisire, microfono per produrre la copia.",
        "Monitor per acquisire, trackpad per produrre la copia.",
        "Scanner per acquisire, stampante per produrre la copia."
      ],
      "corrette": [
        3
      ],
      "spiegazione": "Lo scanner fornisce dati al computer; la stampante produce un risultato su carta."
    },
    {
      "id": "M1-098",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Un compagno dice: «Se ho pagato un software, posso copiarlo e distribuirlo come voglio». Quale correzione è necessaria?",
      "opzioni": [
        "La licenza riguarda soltanto i programmi gratuiti.",
        "Il pagamento non elimina i limiti di copia e distribuzione previsti dalla licenza.",
        "Il pagamento trasforma ogni software in open source.",
        "La distribuzione dipende soltanto dal tipo di CPU."
      ],
      "corrette": [
        1
      ],
      "spiegazione": "Anche per il software a pagamento valgono le condizioni della licenza."
    },
    {
      "id": "M1-008",
      "livello": "facile",
      "tipo": "multipla",
      "domanda": "Quali elementi sono hardware?",
      "opzioni": [
        "La tastiera.",
        "Il sistema operativo.",
        "Il programma di scrittura.",
        "Il processore."
      ],
      "corrette": [
        0,
        3
      ],
      "spiegazione": "Tastiera e processore sono componenti fisici; programma di scrittura e sistema operativo sono software."
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
      "id": "M1-076",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Un compagno propone: «Spostiamo i documenti su un disco più capiente e avremo automaticamente più RAM». Qual è il problema del ragionamento?",
      "opzioni": [
        "Un disco più capiente riduce necessariamente il numero di core.",
        "Capacità di archiviazione e quantità di RAM sono risorse diverse.",
        "La RAM è il nome dato allo spazio ancora libero sul disco.",
        "I documenti non possono essere conservati su un disco."
      ],
      "corrette": [
        1
      ],
      "spiegazione": "Aumentare lo spazio per conservare i file non aumenta automaticamente la memoria di lavoro."
    },
    {
      "id": "M1-037",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Che cos’è l’EULA?",
      "opzioni": [
        "La password necessaria per accendere il computer.",
        "Una memoria per conservare i programmi.",
        "Un programma per preparare presentazioni.",
        "Il contratto di licenza con l’utente finale."
      ],
      "corrette": [
        3
      ],
      "spiegazione": "L’EULA descrive le condizioni alle quali possiamo utilizzare il software."
    },
    {
      "id": "M1-041",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Che cosa indica la parola freeware?",
      "opzioni": [
        "Software di cui si può sempre modificare il codice.",
        "Software utilizzabile senza pagare il prezzo d’acquisto, alle condizioni della licenza.",
        "Software che funziona soltanto durante una prova a pagamento.",
        "Software privo di qualunque condizione di utilizzo."
      ],
      "corrette": [
        1
      ],
      "spiegazione": "Freeware riguarda il prezzo; non implica che il programma sia open source."
    },
    {
      "id": "M1-092",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Una classe inizia un progetto di due mesi con una trial di 15 giorni. Quale controllo è necessario?",
      "opzioni": [
        "Condividere l’account di un compagno per rendere illimitata la prova.",
        "Rinominare la cartella del programma alla scadenza.",
        "Verificare soltanto che il programma si apra il primo giorno.",
        "Verificare condizioni, scadenza e licenza necessaria per proseguire."
      ],
      "corrette": [
        3
      ],
      "spiegazione": "Una prova iniziale non garantisce il diritto di utilizzare il programma per tutta la durata del progetto."
    },
    {
      "id": "M1-026",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Quale porta viene usata per inviare audio e video digitali a un proiettore?",
      "opzioni": [
        "HDMI.",
        "Un ingresso per microfono.",
        "Uno slot per schede SD.",
        "Ethernet."
      ],
      "corrette": [
        0
      ],
      "spiegazione": "HDMI trasporta audio e video digitali verso monitor, televisori e proiettori."
    },
    {
      "id": "M1-004",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Perché anche uno smartphone può essere considerato un computer?",
      "opzioni": [
        "Utilizza una scheda di memoria al posto di un sistema operativo.",
        "Ha componenti hardware e software e permette di elaborare informazioni.",
        "Può sostituire un monitor quando viene appoggiato su una scrivania.",
        "Ha una batteria ricaricabile e uno schermo di piccole dimensioni."
      ],
      "corrette": [
        1
      ],
      "spiegazione": "Uno smartphone ha hardware, esegue programmi e svolge attività proprie dei computer."
    },
    {
      "id": "M1-051",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Per una ricerca devi scrivere il testo, calcolare alcune percentuali e presentare i risultati. Quale insieme di strumenti scegli?",
      "opzioni": [
        "Programma di scrittura, lettore audio e programma di messaggistica.",
        "Browser, lettore audio e applicazione per videochiamate.",
        "Programma di scrittura, foglio elettronico e programma per presentazioni.",
        "Sistema operativo, programma di disegno e lettore video."
      ],
      "corrette": [
        2
      ],
      "spiegazione": "Gli strumenti vanno scelti in base al compito: testi, calcoli e presentazione dei risultati."
    },
    {
      "id": "M1-088",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Due porte hanno entrambe un connettore USB-C. Perché non basta questo dato a dire che hanno la stessa velocità?",
      "opzioni": [
        "La stessa forma del connettore garantisce la stessa velocità.",
        "USB-C descrive la forma; funzioni e velocità richiedono altre informazioni.",
        "Il dispositivo collegato non conta mai per le funzioni disponibili.",
        "Il colore del computer indica la velocità di ogni sua porta."
      ],
      "corrette": [
        1
      ],
      "spiegazione": "La forma del connettore non specifica da sola tutte le capacità del collegamento."
    },
    {
      "id": "M1-019",
      "livello": "facile",
      "tipo": "multipla",
      "domanda": "Quali periferiche permettono al computer di ricevere dati dall’esterno?",
      "opzioni": [
        "La stampante.",
        "Lo scanner.",
        "Il microfono.",
        "Gli altoparlanti."
      ],
      "corrette": [
        1,
        2
      ],
      "spiegazione": "Il microfono acquisisce suoni e lo scanner acquisisce documenti. Stampante e altoparlanti forniscono risultati."
    },
    {
      "id": "M1-049",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Qual è un’idea centrale dell’architettura di Von Neumann?",
      "opzioni": [
        "Dati e istruzioni dei programmi sono mantenuti in una memoria comune.",
        "Un computer non ha bisogno di programmi.",
        "I dati stanno in memoria, ma le istruzioni sono tutte contenute nel case.",
        "Le periferiche eseguono ogni calcolo al posto della CPU."
      ],
      "corrette": [
        0
      ],
      "spiegazione": "Il modello prevede CPU, memoria centrale, input/output e bus; nella memoria si conservano dati e istruzioni."
    },
    {
      "id": "M1-083",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Un’applicazione installata usa Internet per alcune funzioni e altre funzionano offline. Qual è la descrizione più precisa?",
      "opzioni": [
        "Non è software locale perché può collegarsi a Internet.",
        "Tutte le sue funzioni funzionano offline soltanto perché è installato.",
        "Combina funzioni locali e online; bisogna verificare quali servono al proprio lavoro.",
        "L’accesso tramite account rende automaticamente utilizzabili offline anche le funzioni che richiedono Internet."
      ],
      "corrette": [
        2
      ],
      "spiegazione": "Le due modalità possono convivere nello stesso programma."
    },
    {
      "id": "M1-024",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "In classe usi monitor, tastiera e mouse esterni. Come può aiutarti una docking station?",
      "opzioni": [
        "Permette di collegare più periferiche al portatile attraverso un unico collegamento.",
        "Sostituisce il sistema operativo con uno adatto alle periferiche.",
        "Permette di eseguire tutte le applicazioni senza installarle.",
        "Trasforma la RAM in memoria permanente per i documenti."
      ],
      "corrette": [
        0
      ],
      "spiegazione": "La docking station raccoglie i collegamenti a più periferiche; nei modelli compatibili può anche alimentare il portatile."
    },
    {
      "id": "M1-034",
      "livello": "facile",
      "tipo": "singola",
      "domanda": "Quale attività riguarda l’elaborazione multimediale?",
      "opzioni": [
        "Cambiare un disco fisico.",
        "Sostituire una tastiera.",
        "Montare un video.",
        "Collegare il cavo di alimentazione."
      ],
      "corrette": [
        2
      ],
      "spiegazione": "L’elaborazione multimediale comprende modificare foto, video e tracce audio."
    },
    {
      "id": "M1-067",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Hai finito sul computer condiviso, che deve rimanere acceso per il compagno. Quale procedura scegli?",
      "opzioni": [
        "Salvi i documenti e ti disconnetti dall’account del computer.",
        "Lasci la tua sessione aperta e spegni il monitor.",
        "Esci soltanto dal sito che hai utilizzato.",
        "Dai al compagno la tua password per continuare."
      ],
      "corrette": [
        0
      ],
      "spiegazione": "Il logout chiude la tua sessione lasciando acceso il computer per un altro accesso."
    },
    {
      "id": "M1-055",
      "livello": "media",
      "tipo": "multipla",
      "domanda": "Durante una videochiamata, quali dispositivi inviano al computer dati acquisiti dall’esterno?",
      "opzioni": [
        "Gli altoparlanti che riproducono la voce del compagno.",
        "Lo schermo che mostra il compagno.",
        "La webcam che riprende il tuo volto.",
        "Il microfono che acquisisce la tua voce."
      ],
      "corrette": [
        2,
        3
      ],
      "spiegazione": "Webcam e microfono sono input; schermo e altoparlanti sono output."
    },
    {
      "id": "M1-080",
      "livello": "difficile",
      "tipo": "multipla",
      "domanda": "Stai scrivendo e ascoltando musica sullo stesso computer. Quali affermazioni descrivono il ruolo del sistema operativo?",
      "opzioni": [
        "Permette di tenere aperti più programmi.",
        "Diventa un’applicazione di scrittura quando digiti il testo.",
        "Gestisce l’esecuzione delle applicazioni e le risorse.",
        "Fornisce alle applicazioni strumenti per utilizzare l’hardware."
      ],
      "corrette": [
        0,
        2,
        3
      ],
      "spiegazione": "Il sistema operativo resta attivo e media tra applicazioni e risorse del dispositivo."
    },
    {
      "id": "M1-053",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Digiti due numeri, il programma ne calcola la somma e il risultato appare sullo schermo. Quale ordine descrive il lavoro?",
      "opzioni": [
        "Elaborazione, output, input.",
        "Input, elaborazione, output.",
        "Input, output, elaborazione.",
        "Output, input, elaborazione."
      ],
      "corrette": [
        1
      ],
      "spiegazione": "La tastiera fornisce i dati, la CPU li elabora seguendo il programma e lo schermo restituisce il risultato."
    },
    {
      "id": "M1-072",
      "livello": "media",
      "tipo": "singola",
      "domanda": "Un compagno chiama scheda madre il contenitore esterno del computer. Quale distinzione lo aiuta?",
      "opzioni": [
        "La scheda madre mostra le immagini; il case contiene i programmi come un disco.",
        "Case e scheda madre sono due nomi dello stesso componente.",
        "Il case ospita e protegge; la scheda madre collega i componenti principali.",
        "Il case elabora i dati; la scheda madre serve soltanto a riprodurre suoni."
      ],
      "corrette": [
        2
      ],
      "spiegazione": "Contenitore e piastra di collegamento svolgono funzioni diverse all’interno del computer."
    },
    {
      "id": "M1-084",
      "livello": "difficile",
      "tipo": "singola",
      "domanda": "Un compagno sostiene: «Se chiudo il sito della posta, posso lasciare la sessione Windows aperta». Quale risposta corregge il problema?",
      "opzioni": [
        "Basta spegnere il monitor per terminare tutte le sessioni.",
        "Chiudere il sito cambia automaticamente la password Windows.",
        "Il computer condiviso non richiede account personali.",
        "Chiudere il sito non termina la sessione del computer; al termine bisogna salvare e disconnettersi."
      ],
      "corrette": [
        3
      ],
      "spiegazione": "Account del sito e account del computer non coincidono necessariamente e hanno operazioni di uscita distinte."
    },
    {
      "id": "M1-073",
      "livello": "media",
      "tipo": "singola",
      "domanda": "All’avvio trovi selezionato l’account di un compagno. Qual è il comportamento corretto?",
      "opzioni": [
        "Chiedere al compagno la sua password per fare prima.",
        "Selezionare il proprio account e inserire le proprie credenziali.",
        "Usare quell’account perché il computer è condiviso.",
        "Spegnere il monitor per cambiare automaticamente account."
      ],
      "corrette": [
        1
      ],
      "spiegazione": "La condivisione del computer non implica la condivisione degli account."
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
