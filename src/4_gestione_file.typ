// Sezione 4 del syllabus Computer Essentials.
// Testi e schemi ripresi dalle dispense del docente in intrormatica.
// Provenienza e copertura: assets/gestione-file/fonti.json e AGENTS.md.
// Compilazione: typst compile --root . src/4_gestione_file.typ dist/4_gestione_file.pdf

#let rosso = rgb("#c00000")
#let grigio = rgb("#555555")
#let larghezza = 864pt
#let altezza-corpo = 390pt
#let sfondo = rgb("#fbf4f3")

#let presentazione(body) = {
  set document(title: "4. Gestione di file", author: "Federico Mazzini")
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

#let schema(t, st, percorso, nota: none) = slide(titolo: t)[
  #titolo(t, st)
  #place(top + left, dx: 64pt, dy: 155pt,
    image(percorso, width: 832pt, height: if nota == none { 340pt } else { 285pt }, fit: "contain"))
  #if nota != none { blocco(64, 457, 832, nota, corpo: 23) }
]
#show: presentazione

#apertura("Gestione di file", "File, cartelle e supporti di memoria")

// Syllabus: 4.1.4; dispensa File e cartelle, definizione e analogia conservate
#lezione("Che cos’è un file?", "Un contenitore digitale")[
Un *file* è un insieme di informazioni salvate su un computer e identificate da un nome.

Si può immaginare un file come un *contenitore digitale*: al suo interno possono esserci informazioni di diverso tipo, come testi, immagini, suoni o video.

Un documento di testo, una fotografia scattata con lo smartphone, una canzone e un video sono tutti esempi di file.
]

// Syllabus: 4.1.4; dispensa File e cartelle, con richiamo a Windows 10
#lezione("Nome ed estensione", "Come riconosciamo un file")[
Il nome completo di un file comprende due parti, separate da un punto: *il nome scelto per riconoscerlo* e *l’estensione, che ne indica il formato*.

*Relazione di storia.pdf*

*Relazione di storia* descrive il contenuto; *.pdf* è l’estensione.

Il formato aiuta noi a capire di cosa si tratta e il computer a individuare un programma con cui aprirlo. In Windows 10 possiamo mostrare le estensioni da *Esplora file → Visualizza → Estensioni nomi file*.
]

// Syllabus: 4.1.4; tabella delle dispense, integrata con gli eseguibili
#lezione("I tipi di file", "Le estensioni più comuni")[
#table(columns: (1fr, 1.3fr), inset: 6pt,
  table.header([*Tipo di contenuto*], [*Estensioni di esempio*]),
  [Testo e documenti], [.txt, .docx],
  [Fogli elettronici], [.xlsx],
  [Presentazioni], [.pptx],
  [Documenti PDF], [.pdf],
  [Immagini], [.jpg, .png, .gif],
  [Audio e video], [.mp3, .wav, .mp4, .mov],
  [Archivi compressi], [.zip, .rar],
  [Programmi eseguibili in Windows], [.exe],
)
]

// Syllabus: 4.1.1, 4.1.6; dispensa File e cartelle, testi ed esempio ripresi
#lezione("Cartelle e sottocartelle", "Organizzare i materiali")[
Una *cartella*, chiamata anche _directory_, è un contenitore che permette di raggruppare file e mantenerli ordinati. Usare cartelle con nomi chiari aiuta a trovare più facilmente ciò che serve.

Una cartella può contenere *sia file sia altre cartelle*: una cartella contenuta in un’altra viene chiamata *sottocartella*.

Si può creare una cartella per l’anno scolastico e, al suo interno, una cartella per ogni materia. L’insieme di cartelle e sottocartelle forma una *struttura gerarchica* chiamata *albero*.
]

// Syllabus: 4.1.1
#schema("L’albero delle cartelle", "Un esempio con i materiali della classe", "../assets/gestione-file/albero-file-cartelle.svg")

// Syllabus: 4.1.1; dispensa File e cartelle, percorso ed esempio conservati
#lezione("Il percorso di un file", "Un indirizzo per ritrovarlo")[
Il *percorso* di un file, chiamato anche _path_, indica la sua posizione. È come un *indirizzo*: specifica dove trovare il file, indicando le cartelle che lo contengono.

`C:\Documenti\Classe 1A\Informatica\Appunti.txt`

- *C:* indica l’unità di archiviazione.
- *Documenti*, *Classe 1A* e *Informatica* sono le cartelle da attraversare, in quest’ordine.
- *Appunti.txt* è il file da aprire, all’interno di Informatica.

Il simbolo `\` separa i diversi elementi del percorso.
]

// Syllabus: 4.1.1, 4.1.3
#schema("Esplora file", "Il programma con cui ci muoviamo tra i materiali", "../assets/gestione-file/esplora-file.jpg", nota: [Aprire *Esplora file* con *Windows + E*. A sinistra troviamo le posizioni; in alto il percorso e la ricerca; al centro i file della cartella.])

// Syllabus: 4.1.2; spiegazione con screenshot di Windows 10
#slide(titolo: "Le proprietà")[
  #titolo("Le proprietà", "Nome, dimensioni e posizione")
  #blocco(64, 160, 440, corpo: 24)[
    Le *proprietà* descrivono un file o una cartella: nome, tipo, posizione e dimensioni.

    In Windows 10, fare *clic destro → Proprietà*. Nella scheda *Generale* troviamo le informazioni principali.

    La *dimensione* indica quanto spazio occupano i dati; la *posizione* indica dove si trovano.

    Nello screenshot, *Size* indica la dimensione complessiva della cartella; *Location* è la posizione.
  ]
  #place(top + left, dx: 600pt, dy: 145pt, image("../assets/gestione-file/proprieta.jpg", width: 290pt))
]

// Syllabus: 4.1.8; nuova spiegazione nello stile del docente
#lezione("Rinominare", "Cambiare il nome, non il contenuto")[
*Rinominare* significa cambiare il nome di un file o di una cartella. Il contenuto rimane lo stesso.

Selezionare l’elemento, premere *F2* oppure scegliere *clic destro → Rinomina*. Scrivere il nuovo nome e confermare con *Invio*.

Per un file, mantenere l’*estensione corretta*.

Per esempio, posso rinominare *Documento1.docx* in *Relazione di storia.docx*: cambia il nome che descrive il contenuto, non il formato.
]

// Syllabus: 4.2.1; nuova spiegazione nello stile del docente
#lezione("Selezionare file e cartelle", "Uno, alcuni oppure tutti")[
Prima di copiare, spostare o eliminare, dobbiamo indicare *su quali elementi* vogliamo lavorare.

- *Un elemento*: fare clic sul suo nome o sulla sua icona.
- *Elementi vicini nell’elenco*: selezionare il primo, tenere premuto *Shift* e selezionare l’ultimo.
- *Elementi non vicini*: tenere premuto *Ctrl* e fare clic sugli elementi desiderati.
- *Tutti gli elementi della cartella*: premere *Ctrl + A*.

Prima di dare il comando, controllare quali file risultano selezionati.
]

// Syllabus: 4.2.2; spiegazione con screenshot di Windows 10
#slide(titolo: "Ordinare i materiali")[
  #titolo("Ordinare i materiali", "Nome, dimensione, tipo e data")
  #blocco(64, 160, 350, corpo: 23)[
    *Ordinare* cambia l’ordine degli elementi, senza modificarli o spostarli.

    In *Dettagli*, fare clic su *Nome*, *Dimensione*, *Tipo* o *Data ultima modifica*. Un altro clic inverte l’ordine.

    Possiamo anche usare *Visualizza → Ordina per*.

    Per dimensione: *crescente* dal più piccolo al più grande; *decrescente* dal più grande al più piccolo.
  ]
  #place(top + left, dx: 450pt, dy: 155pt, image("../assets/gestione-file/ordinamento.jpg", width: 450pt))
]

// Syllabus: 4.2.3; nuova spiegazione nello stile del docente
#lezione("Copiare e spostare in Windows", "Selezionare, scegliere il comando, indicare dove")[
Per *copiare*: selezionare file o cartelle, premere *Ctrl + C*, aprire la cartella di destinazione e premere *Ctrl + V*.

Per *spostare*: selezionare gli elementi, premere *Ctrl + X*, aprire la destinazione e premere *Ctrl + V*.

Gli stessi comandi si chiamano *Copia*, *Taglia* e *Incolla* e si trovano anche nel menu del clic destro.

Al termine, verificare che i materiali siano nella posizione desiderata.
]

// Syllabus: 4.2.4, 4.2.5; accorpamento delle precedenti slide 21 e 22
#lezione("Il cestino", "Eliminare, ripristinare e svuotare")[
Quando eliminiamo un file dal disco locale, normalmente Windows lo sposta nel *Cestino*. Possiamo selezionarlo e premere *Canc*, oppure scegliere *clic destro → Elimina*.

Se abbiamo sbagliato, apriamo il *Cestino*, selezioniamo il file e scegliamo *Ripristina*. Il file torna nella posizione originale.

I file nel cestino continuano a occupare spazio. Per eliminarli, fare *clic destro sull’icona del Cestino → Svuota cestino* e confermare.

Dopo lo svuotamento, non si recuperano più con il normale comando *Ripristina*. Prima di procedere, controllare che non ci siano materiali da conservare.
]

// Syllabus: 4.3.1; integrazione dei supporti; chiusura adattata dalla dispensa File e cartelle
#lezione("Dove conserviamo i file?", "Supporti e unità di archiviazione")[
- *Dischi interni ed esterni*: HDD o SSD, dentro il computer oppure collegati dall’esterno.
- *Chiavette USB e schede di memoria*: supporti piccoli e trasportabili, usati anche in fotocamere e altri dispositivi.
- *CD e DVD*: supporti ottici che richiedono un lettore compatibile.
- *Unità di rete*: spazio messo a disposizione da un altro dispositivo attraverso una rete.
- *Memorizzazione online*: file conservati sui server di servizi come Drive o OneDrive.

Cambia il luogo in cui vengono conservati i file, non la possibilità di organizzarli in cartelle.
]

// Syllabus: 4.3.2; dispensa Bit, byte e dimensioni, definizione e analogia riprese
#lezione("Le unità di misura", "Byte, KB, MB, GB e TB")[
La *dimensione di un file*, chiamata anche _peso_, indica quanto spazio occupa nella memoria del computer e si misura in *byte*.

Per misurare una distanza non si usano sempre i metri: a volte è più comodo usare i chilometri. Allo stesso modo, per i dati si usano i *multipli del byte*.

- *KB*: kilobyte.
- *MB*: megabyte.
- *GB*: gigabyte.
- *TB*: terabyte.

Sono unità via via più grandi. La capacità di un supporto e la dimensione dei file si possono confrontare dopo averle espresse nella stessa unità.
]

// Syllabus: 4.3.2, 4.3.3
#schema("Lo spazio di archiviazione", "Capacità totale, spazio occupato e disponibile", "../assets/gestione-file/archiviazione.svg", nota: [Ogni dispositivo ha una capacità di archiviazione. Una parte è già occupata; quella che rimane è lo *spazio disponibile* per nuovi dati.])

// Syllabus: 4.3.3
#schema("Quanto spazio è rimasto?", "Questo PC e le proprietà dell’unità", "../assets/gestione-file/spazio-unita.jpg", nota: [Aprire *Esplora file → Questo PC*: sotto le unità troviamo lo spazio libero. Per altre informazioni, scegliere *clic destro sull’unità → Proprietà*.])

// Syllabus: 4.3.4; dispensa File e cartelle, definizione e scopi ripresi
#lezione("I file ZIP", "Più materiali in un unico file")[
Uno *ZIP* è un file con estensione `.zip` che raccoglie altri file e cartelle in *un unico file*, mantenendo l’organizzazione delle sottocartelle. Si chiama anche *archivio ZIP*.

Lo usiamo per *inviare più file insieme*, per esempio documenti e immagini di una ricerca, e per *risparmiare spazio*.

La compressione può ridurre la dimensione dei file, ma il risultato dipende dal loro contenuto: un archivio non diventa necessariamente molto più piccolo.
]

// Syllabus: 4.3.5
#schema("Creare uno ZIP", "Dalla cartella a un unico file", "../assets/gestione-file/compressione-zip.svg", nota: [Lo ZIP contiene una *copia dei file e delle sottocartelle*. La cartella originale rimane al suo posto e puoi continuare a usarla.])

// Syllabus: 4.3.5; nuova spiegazione nello stile del docente
#lezione("Comprimere in Windows 10", "Creare una cartella compressa")[
Selezionare i file o la cartella da raccogliere. Fare *clic destro → Invia a → Cartella compressa*.

Windows crea un nuovo file `.zip`. Scrivere un nome significativo, ad esempio *Materiali ricerca.zip*.

Aprire l’archivio e controllare che contenga tutti i materiali previsti.

Non serve eliminare la cartella originale: creare lo ZIP non la sposta e non la sostituisce.
]

// Syllabus: 4.3.6
#schema("Estrarre uno ZIP", "Ritrovare i file e le cartelle", "../assets/gestione-file/estrazione-zip.svg", nota: [*Estrarre uno ZIP* significa copiare i file e le cartelle che contiene in una cartella del computer. Anche lo ZIP originale rimane disponibile.])

// Syllabus: 4.3.6; procedura nuova; spiegazioni dalla dispensa File e cartelle
#lezione("Estrarre in Windows 10", "Scegliere la cartella di destinazione")[
Fare *clic destro sul file ZIP → Estrai tutto*. Indicare la cartella di destinazione e premere *Estrai*.

Per lavorare sui documenti ricevuti, prima estrai il contenuto e poi apri i file estratti. Controlla che ci siano tutti i materiali e le sottocartelle.
]
