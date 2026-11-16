// Sezione 2: selezione concordata con il docente; non copre i punti esclusi.
// Screenshot esterni di Windows 10: provenienza in assets/windows10/fonti.json.
// Compilazione: typst compile --root . src/2_desktop_icone_impostazioni.typ dist/2_desktop_icone_impostazioni.pdf

#let rosso = rgb("#c00000")
#let grigio = rgb("#555555")
#let larghezza = 864pt
#let altezza-corpo = 390pt
#let sfondo = rgb("#fbf4f3")

#let presentazione(body) = {
  set document(title: "2. Desktop, icone e impostazioni", author: "Federico Mazzini")
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
#show: presentazione

// Copertina nello stesso stile della prima presentazione.
#apertura("Desktop, icone e impostazioni", "L’ambiente di lavoro di Windows 10")

// 1 — 2.1.1 e 2.1.2. Solo le icone effettivamente presenti nello screenshot.
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

// 2 — 2.2.2. Richiamo concettuale; operazioni mostrate dal docente dal vivo.
#slide(titolo: "Applicazioni e finestre")[
  #titolo("Applicazioni e finestre", "Più programmi contemporaneamente")
  #blocco(64, 160, 335, corpo: 23)[
    Il sistema operativo gestisce *più applicazioni alla volta*, come Esplora file e Impostazioni nello screenshot.

    Possiamo *spostare, ridimensionare, ridurre a icona, ingrandire e ripristinare* le finestre.

    Ridurre a icona lascia l’applicazione aperta. Chiudere una finestra può richiedere di *salvare il lavoro*.
  ]
  #place(top + left, dx: 425pt, dy: 180pt, image("../assets/windows10/finestre-affiancate.jpg", width: 485pt))
]

// 3 — 2.3.2. Accenno con screenshot; consultazione mostrata dal vivo.
#slide(titolo: "Le informazioni del computer")[
  #titolo("Le informazioni del computer", "Sistema operativo e RAM")
  #blocco(64, 160, 295, corpo: 23)[
    Possiamo consultare il *nome e la versione di Windows* e la quantità di *RAM installata*.

    Queste informazioni aiutano a conoscere il computer e a verificare la compatibilità delle applicazioni.

    In Windows 10: *Impostazioni → Sistema → Informazioni su* (o *Informazioni sul sistema*).
  ]
  #place(top + left, dx: 395pt, dy: 170pt, image("../assets/windows10/informazioni-sistema.jpg", width: 515pt))
]

// 4 — 2.3.5. Screenshot reale di Gestione attività di Windows 10.
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

// 5 — 2.3.6. Scelta del docente: breve accenno per dimostrazione dal vivo.
#lezione("Installare e disinstallare", "La gestione delle applicazioni")[
*Installare* un’applicazione significa predisporla sul computer per poterla utilizzare. Si può partire dal *Microsoft Store* oppure dal programma di installazione fornito dal produttore.

*Disinstallare* significa rimuoverla attraverso gli strumenti previsti dal sistema operativo. In Windows 10 troviamo l’elenco in *Impostazioni → App → App e funzionalità*.

Cancellare il collegamento dal desktop *non disinstalla* il programma.
]

// 6 — 2.3.7. Screenshot di espulsione; spiegazione limitata a due righe.
#slide(titolo: "Scollegare una chiavetta USB")[
  #titolo("Scollegare una chiavetta USB", "Espelli dispositivo")
  #place(top + left, dx: 225pt, dy: 145pt, image("../assets/windows10/espelli-usb.jpg", width: 510pt))
  #blocco(64, 458, 832, corpo: 23)[Terminati i trasferimenti, aprire l’icona USB e scegliere *Espelli* (*Eject*).\ Attendere la conferma di Windows prima di scollegare il dispositivo.]
]

// 7 — 2.3.8. App Cattura e annota di Windows 10, non lo Strumento di Windows 11.
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
