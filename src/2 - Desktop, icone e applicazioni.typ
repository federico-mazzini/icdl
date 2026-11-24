// Fonte: Mario R. Storchi, ICDL Computer Essentials eBook, cap. 2, pp. 23–38.
// Immagini ebook: © 2020 AICA & Edizioni Manna.
// Presentazione unificata: priorità ai testi e alle immagini della selezione del docente.
// Fonti e mappatura: assets/ebook-capitolo-2/fonti.json e assets/windows10/fonti.json.
// Il precedente URL 2_desktop_icone_impostazioni.pdf è un alias di questo PDF.
#let rosso = rgb("#c00000")
#let grigio = rgb("#555555")
#let larghezza = 864pt
#let altezza-corpo = 390pt
#let sfondo = rgb("#fbf4f3")

#let presentazione(body) = {
  set document(title: "2 - Desktop, icone e applicazioni", author: "Federico Mazzini")
  set page(width: 960pt, height: 540pt, margin: 0pt)
  set text(font: "Libertinus Serif", size: 26pt, lang: "it", hyphenate: false,
    fill: rgb("#202020"), top-edge: 0pt, bottom-edge: 0pt)
  set par(leading: 0.44em, spacing: 0.8em, justify: false)
  set list(indent: 4pt, body-indent: 11pt, tight: false, spacing: 0.5em)
  set enum(numbering: "1", indent: 4pt, body-indent: 10pt, tight: false, spacing: 0.5em)
  body
}

// Le coordinate sono in punti nel formato 16:9 del modello.
// Ogni riga mantiene posizione, capoversi ed enfasi del PDF di origine.
#let riga(x, y, corpo, body, tinta: rgb("#202020"), peso: "regular", angolo: 0deg,
    centro: false, ampiezza: none, url: none) = context {
  let contenuto = text(size: corpo * 1pt, fill: tinta, weight: peso, body)
  if url != none { contenuto = link(url, contenuto) }
  let misura = measure(contenuto)
  // Riduce solo le righe che supererebbero il loro ingombro originale.
  if ampiezza != none and misura.width > ampiezza * 1pt {
    contenuto = scale(x: ampiezza * 1pt / misura.width * 100%, y: 100%,
      origin: left + top, reflow: true, contenuto)
  }
  let offset = if centro { measure(contenuto).width / 2 } else { 0pt }
  place(top + left, dx: x * 1pt - offset, dy: y * 1pt,
    rotate(angolo, origin: left + top, reflow: false, contenuto))
}

#let slide(grafica: none, titolo: "", body) = page[
  #if grafica != none {
    place(top + left, image(grafica, width: 960pt, height: 540pt))
  }
  #body
  // Il piccolo fregio rosso è il segno grafico del modello.
  #place(top + left, dx: 48pt, dy: 26pt,
    rect(width: 40pt, height: 3pt, fill: rosso, stroke: none))
  // I crediti originali restano nella fascia inferiore; il contatore è progressivo.
  #place(top + left, dx: 370pt, dy: 525pt, box(width: 220pt)[
    #context align(center)[#text(size: 11pt, fill: grigio)[#counter(page).display() / #counter(page).final().first()]]
  ])
]


// Nuove slide: stessi caratteri, titoli centrati, colori e piè di pagina.
// Il corpo scorre in paragrafi modificabili, senza coordinate per ogni riga.
#let area-nuova(body) = context {
  for corpo in (26, 25, 24, 23) {
    let prova = block(width: 832pt, breakable: false)[
      #set text(size: corpo * 1pt, top-edge: "cap-height", bottom-edge: "descender")
      #set par(leading: 0.32em, spacing: 0.58em)
      #set list(indent: 5pt, body-indent: 12pt, spacing: 0.45em)
      #body
    ]
    if measure(prova, width: 832pt).height <= 338pt { return prova }
  }
  panic("Il testo della nuova slide supera l'area disponibile.")
}
#let lezione(titolo, sottotitolo, body) = slide(titolo: titolo)[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 864)[#text(weight: "bold", titolo)]
  #riga(480, 115.79, 27, centro: true, ampiezza: 864)[#text(weight: "bold", sottotitolo)]
  #place(top + left, dx: 64pt, dy: 158pt, area-nuova(body))
  #riga(29.8, 528.275, 9.68)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68)[#text("Prof. Federico Mazzini")]
]
#let apertura(titolo, sottotitolo) = slide(titolo: titolo)[
  #riga(480, 292, 48, tinta: rosso, centro: true, ampiezza: 864)[#text(weight: "bold", titolo)]
  #riga(480, 334, 28, centro: true, ampiezza: 864)[#text(weight: "bold", sottotitolo)]
  #riga(29.8, 528.275, 9.68)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68)[#text("Prof. Federico Mazzini")]
]


#let blocco(x, y, w, body, corpo: 25) = place(top + left, dx: x * 1pt, dy: y * 1pt,
  block(width: w * 1pt)[
    #set text(size: corpo * 1pt, top-edge: "cap-height", bottom-edge: "descender")
    #set par(leading: 0.32em, spacing: 0.65em)
    #body
  ])
#let titolo(a, b) = {
  riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 864, text(weight: "bold", a))
  riga(480, 115.79, 27, centro: true, ampiezza: 864, text(weight: "bold", b))
}
#let freccia(x, y, tx, ty) = {
  let dx = tx - x
  let dy = ty - y
  let l = calc.sqrt(dx*dx + dy*dy)
  let ux = dx/l
  let uy = dy/l
  place(top + left, line(start: (x*1pt,y*1pt), end: (tx*1pt,ty*1pt), stroke: 1.7pt + rosso))
  place(top + left, polygon(fill: rosso, stroke: none,
    (tx*1pt,ty*1pt), ((tx - 9*ux - 3.5*uy)*1pt,(ty - 9*uy + 3.5*ux)*1pt),
    ((tx - 9*ux + 3.5*uy)*1pt,(ty - 9*uy - 3.5*ux)*1pt)))
}

// Impaginazione del capitolo completo: misura i testi prima di posizionarli.
#let testo-misurato(w, h, body, corpo: 25) = context {
  for taille in (corpo, corpo - 1, corpo - 2, corpo - 3) {
  let b = block(width: w * 1pt, breakable: false)[
    #set text(size: taille * 1pt, top-edge: "cap-height", bottom-edge: "descender")
    #set par(leading: 0.30em, spacing: 0.65em)
    #set list(indent: 5pt, body-indent: 12pt, spacing: 0.45em)
    #set enum(indent: 5pt, body-indent: 12pt, spacing: 0.45em)
    #body
  ]
  if measure(b, width: w * 1pt).height <= h * 1pt { return b }
  }
  panic("Testo fuori dall’area della slide: " + repr(body))
}
#let figura(nome, w, h) = image("../assets/ebook-capitolo-2/" + nome, width: w * 1pt, height: h * 1pt, fit: "contain")
#let illustrazione(a, b, testo, nome, corpo: 25) = slide(titolo: a)[
  #titolo(a, b)
  #place(top + left, dx: 64pt, dy: 163pt, testo-misurato(345, 333, testo, corpo: corpo))
  #place(top + left, dx: 435pt, dy: 153pt, figura(nome, 465, 345))
  #riga(29.8, 528.275, 9.68)[Polo Tecnico Professionale di Lugo]
  #riga(831.386, 528.275, 9.68)[Prof. Federico Mazzini]
]
#let coppia(a, b, testo, img1, img2) = slide(titolo: a)[
  #titolo(a, b)
  #place(top + left, dx: 64pt, dy: 157pt, testo-misurato(832, 112, testo, corpo: 24))
  #place(top + left, dx: 64pt, dy: 285pt, figura(img1, 396, 210))
  #place(top + left, dx: 500pt, dy: 285pt, figura(img2, 396, 210))
  #riga(29.8, 528.275, 9.68)[Polo Tecnico Professionale di Lugo]
  #riga(831.386, 528.275, 9.68)[Prof. Federico Mazzini]
]
#show: presentazione
#apertura("Desktop, icone e applicazioni", "L’ambiente di lavoro di Windows 10")

// Ebook: pagine 23; syllabus: 2.1.1
#illustrazione("Il desktop", "La scrivania del computer", [
Il *desktop* è lo spazio di lavoro che compare dopo l’accesso al sistema operativo.

Come su una scrivania, troviamo gli oggetti che usiamo più spesso: *icone* di documenti, cartelle e applicazioni.

Nella parte inferiore si trova la *barra delle applicazioni*.
], "p24-02.png", corpo: 25)

// Docente: precedente slide 2; syllabus: 2.1.1, 2.1.2.
#slide(titolo: "Desktop e barra delle applicazioni")[
  #titolo("Desktop e barra delle applicazioni", "Windows 10")
  #blocco(64, 142, 832)[Il *desktop* è lo spazio di lavoro del sistema operativo. La *barra delle applicazioni* permette di avviare programmi, ritrovare quelli aperti e leggere informazioni sul sistema.]
  // Ritaglio nativo della sola barra: il file originale Microsoft rimane intatto.
  #place(top + left, dx: 48pt, dy: 258pt, image("../assets/windows10/barra-ritaglio.svg", width: 864pt))
  #freccia(90, 345, 64, 279)
  #blocco(48, 355, 120, corpo: 20)[*Start*\ Applicazioni e comandi del sistema.]
  #freccia(215, 345, 210, 279)
  #blocco(180, 355, 130, corpo: 20)[*Ricerca*\ Cercare app, file e impostazioni.]
  #freccia(350, 345, 357, 279)
  #blocco(320, 355, 130, corpo: 20)[*Attività*\ Panoramica del lavoro aperto.]
  #freccia(485, 345, 424, 279)
  #freccia(510, 345, 459, 279)
  #freccia(535, 345, 495, 279)
  #blocco(465, 355, 160, corpo: 20)[*Applicazioni*\ Edge, Esplora file e Microsoft Store.]
  #freccia(705, 345, 777, 279)
  #blocco(650, 355, 140, corpo: 20)[*Area di notifica*\ Rete, volume e altre icone di sistema.]
  #freccia(860, 345, 845, 279)
  #blocco(805, 355, 105, corpo: 20)[*Data e ora*\ Orologio del computer.]
]

// Ebook: pagine 24; syllabus: 2.1.1
#illustrazione("Visualizzazione attività", "Le anteprime delle finestre aperte", [
Il pulsante *Visualizzazione attività* mostra le anteprime delle applicazioni aperte.

Cliccando su un’anteprima portiamo quella finestra in primo piano.

Con *Nuovo desktop* possiamo creare altri desktop virtuali per organizzare il lavoro.
], "p25-01.png", corpo: 25)

// Ebook: pagine 24; syllabus: 2.1.1
#illustrazione("Il Centro notifiche", "Messaggi e comandi rapidi", [
L’icona accanto all’orologio apre il *Centro notifiche*.

Qui troviamo messaggi del sistema e delle applicazioni.

Nella parte inferiore ci sono comandi rapidi, ad esempio per *Wi-Fi, Bluetooth, luminosità* e modalità aereo.
], "p25-02.png", corpo: 25)

// Ebook: pagine 25; syllabus: 2.1.2
#illustrazione("Le icone", "Piccole immagini che rappresentano oggetti", [
Un’icona può rappresentare un *file*, una *cartella*, un’*applicazione*, una stampante o un’unità di archiviazione.

Sul desktop, un *doppio clic* apre l’oggetto. Su uno schermo touch si tocca l’icona.

Un file si apre con l’applicazione associata al suo tipo.
], "p26-01.png", corpo: 25)

// Ebook: pagine 25, 26; syllabus: 2.1.2
#lezione("Cartelle, unità e cestino", "Riconoscere ciò che stiamo aprendo")[
- Una *cartella* contiene file e altre cartelle. Aprendola ne vediamo il contenuto.
- In *Questo PC* troviamo le unità di archiviazione. Le lettere, come *C:* o *D:*, aiutano a identificarle e possono variare tra computer.
- L’icona della *stampante* dà accesso alla coda e alle proprietà di stampa.
- Il *Cestino* raccoglie i file e le cartelle eliminati che possono essere ripristinati.
]

// Ebook: pagine 26, 27; syllabus: 2.1.4
#lezione("I collegamenti", "Una scorciatoia per aprire un oggetto")[
Un *collegamento* (o alias) permette di raggiungere rapidamente un’applicazione, un file o una cartella.

Per un’applicazione nel menu Start: *tasto destro → Aggiungi a Start*, oppure *Altro → Aggiungi alla barra delle applicazioni*.

Per un file o una cartella in Esplora file: *tasto destro → Invia a → Desktop (crea collegamento)*.
]

// Ebook: pagine 27; syllabus: 2.2.1
#illustrazione("Le parti di una finestra", "Il contenitore del nostro lavoro", [
La *barra del titolo* mostra il nome della cartella o dell’applicazione.

I *menu* raccolgono i comandi; la *barra degli strumenti* offre pulsanti per richiamarli rapidamente.

La *barra di stato*, in basso, mostra informazioni sul contenuto o sull’operazione in corso.
], "p28-02.png", corpo: 25)

// Docente: precedente slide 3; dettagli sui pulsanti dall’ebook, p. 28; syllabus: 2.2.2.
#slide(titolo: "Applicazioni e finestre")[
  #titolo("Applicazioni e finestre", "Più programmi contemporaneamente")
  #place(top + left, dx: 64pt, dy: 160pt, testo-misurato(335, 338, [
    Il sistema operativo gestisce *più applicazioni alla volta*, come Esplora file e Impostazioni nello screenshot.

    *Riduci a icona* (linea) lascia l’applicazione aperta sulla barra. *Massimizza* (quadrato) porta la finestra a tutto schermo; *Ripristina* (due quadrati) torna alle dimensioni precedenti.

    *Chiudi* (X) chiude la finestra e può richiedere di *salvare il lavoro*.
  ], corpo: 23))
  #place(top + left, dx: 425pt, dy: 180pt, image("../assets/windows10/finestre-affiancate.jpg", width: 485pt))
]

// Ebook: pagine 28, 29; syllabus: 2.2.2
#lezione("Spostare e ridimensionare", "Trascinare la parte giusta")[
Per *spostare* una finestra trasciniamo la sua *barra del titolo*.

Per *ridimensionarla*, posizioniamo il puntatore su un bordo: quando diventa una doppia freccia, trasciniamo il bordo.

Trascinando un *angolo* cambiamo insieme altezza e larghezza.

Prima di ridimensionare una finestra a tutto schermo, usiamo *Ripristina*.
]

// Ebook: pagine 29; syllabus: 2.2.3
#illustrazione("Passare da una finestra all’altra", "Più applicazioni contemporaneamente", [
Possiamo lasciare aperto un documento mentre consultiamo un altro programma.

Per cambiare finestra usiamo l’icona sulla *barra delle applicazioni* o un’anteprima in *Visualizzazione attività*.

Con la tastiera: tenere premuto *Alt*, premere *Tab* per scegliere e rilasciare per attivare la finestra.
], "p25-01.png", corpo: 25)

// Ebook: pagine 30; syllabus: 2.3
#illustrazione("Impostazioni di Windows", "Il pannello per configurare il computer", [
Da *Start → Impostazioni* apriamo le categorie del sistema.

Le sezioni usano icone, descrizioni e *interruttori* per attivare o disattivare le funzioni.

Windows 10 conserva anche il *Pannello di controllo*.
], "p31-02.png", corpo: 25)

// Ebook: pagine 30, 31; syllabus: 2.3.1
#illustrazione("Cercare un comando o una guida", "La casella di ricerca accanto a Start", [
Digitare una o più parole che descrivono ciò che serve.

Windows propone applicazioni, impostazioni, file e risultati di ricerca.

Selezionare il risultato adatto per aprirlo o leggere le informazioni. Nell’esempio cerchiamo *luminosità*.
], "p32-01.png", corpo: 25)

// Docente: precedente slide 4; processore dall’ebook, p. 31; syllabus: 2.3.2.
#slide(titolo: "Le informazioni del computer")[
  #titolo("Le informazioni del computer", "Sistema operativo, processore e RAM")
  #blocco(64, 160, 295, corpo: 23)[
    Possiamo consultare il *nome e la versione di Windows*, il tipo di processore e la quantità di *RAM installata*.

    Queste informazioni aiutano a conoscere il computer e a verificare la compatibilità delle applicazioni.

    In Windows 10: *Impostazioni → Sistema → Informazioni su* (o *Informazioni sul sistema*).
  ]
  #place(top + left, dx: 395pt, dy: 170pt, image("../assets/windows10/informazioni-sistema.jpg", width: 515pt))
]

// Ebook: pagine 32; syllabus: 2.3.3
#illustrazione("Data e ora", "Regolazione automatica o manuale", [
In *Start → Impostazioni → Data/ora e lingua* troviamo orologio e calendario.

Per la regolazione manuale, disattivare l’impostazione automatica, scegliere *Modifica*, impostare data e ora e confermare.
], "p33-01.png")

// Ebook: pagine 32; syllabus: 2.3.3
#illustrazione("Il volume audio", "Regolare il suono o disattivarlo", [
Cliccare sull’icona dell’*altoparlante* nell’area di notifica.

Spostare il cursore a destra per aumentare il volume, a sinistra per diminuirlo.

Cliccare sull’altoparlante per disattivare l’audio (*mute*) o riattivarlo.
], "p33-03.png", corpo: 25)

// Ebook: pagine 33; syllabus: 2.3.3
#illustrazione("Le impostazioni dello schermo", "Luminosità, dimensioni e risoluzione", [
In *Start → Impostazioni → Sistema → Schermo* troviamo le opzioni di visualizzazione.

La *risoluzione* indica il numero di pixel visualizzati. Le schermate dell’ebook mostrano anche le impostazioni avanzate; le voci cambiano tra versioni di Windows 10.
], "p34-01.png")

#illustrazione("La risoluzione dello schermo", "Il dettaglio delle impostazioni avanzate", [
La risoluzione indica quanti *pixel* formano l’immagine sullo schermo.

Le impostazioni avanzate mostrate nell’ebook permettono di leggere risoluzione e altre proprietà.

Windows propone impostazioni adatte allo schermo collegato.
], "p34-02.png")

// Ebook: pagine 34; syllabus: 2.3.3
#illustrazione("Lo sfondo del desktop", "Personalizzare l’ambiente di lavoro", [
Aprire *Start → Impostazioni → Personalizzazione → Sfondo*.

Scegliere uno degli sfondi proposti oppure *Sfoglia* per selezionare un’immagine sul computer.

L’anteprima mostra il risultato della scelta.
], "p35-02.png", corpo: 25)

// Ebook: pagine 34; syllabus: 2.3.4
#illustrazione("Aggiungere una lingua", "La disposizione dei tasti", [
La lingua della tastiera determina come vengono inseriti lettere, accenti e simboli.

Aprire *Start → Impostazioni → Data/ora e lingua → Lingua*; scegliere *Aggiungi una lingua*, selezionarla e completare l’installazione.
], "p35-03.png")

#illustrazione("Installare una lingua", "Scegliere la lingua dall’elenco", [
Dopo *Aggiungi una lingua*, cercare o selezionare la lingua desiderata e procedere con *Avanti*.

Completare le richieste di installazione. La nuova lingua sarà disponibile nelle impostazioni della tastiera.
], "p35-01.png")

// Ebook: pagine 35; syllabus: 2.3.4
#illustrazione("Scegliere o rimuovere una lingua", "Le lingue disponibili per la tastiera", [
La sigla vicino all’orologio, come *ITA* o *FRA*, permette di scegliere la lingua della tastiera.

Cliccare sulla sigla e selezionare la lingua desiderata. Nelle opzioni avanzate della tastiera si può impostare il metodo di input predefinito.
], "p36-03.png")

// Docente: precedente slide 5; syllabus: 2.3.5.
#slide(titolo: "Un’applicazione non risponde")[
  #titolo("Un’applicazione non risponde", "Gestione attività")
  #blocco(64, 160, 405, corpo: 25)[
    Se un programma è bloccato, il sistema operativo può *terminarlo*.

    1. Aprire *Gestione attività* con *Ctrl + Shift + Esc*.
    2. Selezionare l’applicazione nella scheda *Processi*.
    3. Premere *Termina attività* (*End task* nello screenshot).

    Il lavoro non salvato nell’applicazione può andare perso.
  ]
  #place(top + left, dx: 515pt, dy: 151pt, image("../assets/windows10/gestione-attivita.png", width: 375pt))
]

// Docente: precedente slide 6; syllabus: 2.3.6.
#lezione("Installare e disinstallare", "La gestione delle applicazioni")[
*Installare* un’applicazione significa predisporla sul computer per poterla utilizzare. Si può partire dal *Microsoft Store* oppure dal programma di installazione fornito dal produttore.

*Disinstallare* significa rimuoverla attraverso gli strumenti previsti dal sistema operativo. In Windows 10 troviamo l’elenco in *Impostazioni → App → App e funzionalità*.

Cancellare il collegamento dal desktop *non disinstalla* il programma.
]

// Ebook: pagine 36; syllabus: 2.3.6
#illustrazione("Installare da un file scaricato", "Eseguire subito o salvare per dopo", [
Il browser può proporre *Esegui* per avviare il programma oppure *Salva* per conservare il file di installazione.

Possono comparire avvisi di protezione: leggere l’origine del file e il messaggio prima di confermare. L’immagine mostra la finestra riportata nell’ebook.
], "p37-01.png", corpo: 25)

// Ebook: pagine 37; syllabus: 2.3.6
#illustrazione("La conferma di installazione", "Il controllo dell’account utente", [
Windows può chiedere il permesso di apportare modifiche al dispositivo.

La finestra indica il programma e le informazioni sull’autore.

Leggere la richiesta e verificare che corrisponda all’installazione avviata prima di scegliere se procedere.
], "p38-01.png", corpo: 25)

// Ebook: pagine 37; syllabus: 2.3.6
#illustrazione("Disinstallare un’applicazione", "Usare la procedura di rimozione", [
Nell’elenco *App e funzionalità*, cercare il programma da rimuovere.

Selezionarlo e scegliere *Disinstalla*. Confermare la richiesta e seguire le istruzioni fino al termine della procedura.
], "p38-02.png", corpo: 25)

// Ebook: pagine 37, 38; syllabus: 2.3.7
#lezione("Collegare un dispositivo USB", "Connettore, alimentazione e driver")[
Una chiavetta si collega direttamente alla porta USB; altri dispositivi richiedono un cavo.

Windows cerca il *driver*, cioè il software necessario per far funzionare il dispositivo. A volte occorre installarlo manualmente.

Se il dispositivo non viene riconosciuto, controllare collegamento, accensione, alimentazione e compatibilità.
]

// Docente: precedente slide 7; syllabus: 2.3.7.
#slide(titolo: "Scollegare una chiavetta USB")[
  #titolo("Scollegare una chiavetta USB", "Espelli dispositivo")
  #place(top + left, dx: 225pt, dy: 145pt, image("../assets/windows10/espelli-usb.jpg", width: 510pt))
  #blocco(64, 458, 832, corpo: 23)[Terminati i trasferimenti, aprire l’icona USB e scegliere *Espelli* (*Eject*).\ Attendere la conferma di Windows prima di scollegare il dispositivo.]
]

// Ebook: pagine 38; syllabus: 2.3.8
#lezione("Catturare lo schermo", "Un’immagine di ciò che vediamo")[
Per catturare lo schermo con la tastiera:

- *Stamp*: copia negli Appunti l’immagine dello schermo.
- *Alt + Stamp*: copia l’immagine della sola finestra attiva.

Aprire un programma come *Paint*, incollare la cattura e salvarla come immagine.
]

// Docente: precedente slide 8; syllabus: 2.3.8.
#slide(titolo: "Catturare lo schermo")[
  #titolo("Catturare lo schermo", "Cattura e annota")
  #blocco(64, 160, 355, corpo: 25)[
    Uno *screenshot* è un’immagine di ciò che compare sullo schermo.

    *Windows + Shift + S*

    Scegliere la modalità di cattura e selezionare l’area, una finestra o l’intero schermo.

    Aprire la notifica per vedere la cattura nell’app, annotarla e salvarla.
  ]
  // Ritaglio nativo della finestra dell’app, conservando lo screenshot originale.
  #place(top + left, dx: 465pt, dy: 153pt, image("../assets/windows10/cattura-ritaglio.svg", width: 430pt))
]
