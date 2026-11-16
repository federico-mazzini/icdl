// Sezione 1 del syllabus locale: Computer e dispositivi.
// Ogni slide originale mantenuta è identificata dal relativo numero e PDF.
// Le nuove slide indicano in commento i riferimenti del syllabus coperti.
// Modello: https://github.com/federico-mazzini/dispense-comunicazione/blob/main/styles/slides.typ
// Palette, carattere, formato 960 × 540, fregio e numerazione dal modello.
// Le slide mantenute conservano posizioni, immagini e testi dai PDF in mie_slide/.
// Le integrazioni seguono solo la sezione 1 di syllabus.pdf, pagine 3–4.
// Unico sorgente Typst: i file SVG contengono solo immagini, forme e diagrammi.
// Nessuna slide è incorporata come screenshot; tutti i testi estratti sono qui sotto.
// Compilazione: typst compile 1_computer_dispositivi.typ dist/1_computer_dispositivi.pdf

#let rosso = rgb("#c00000")
#let grigio = rgb("#555555")
#let larghezza = 864pt
#let altezza-corpo = 390pt
#let sfondo = rgb("#fbf4f3")

#let presentazione(body) = {
  set document(title: "1. Computer e dispositivi", author: "Federico Mazzini")
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

#show: presentazione

// Apertura: 1
#apertura("Computer e dispositivi", "ICT, hardware, software e utilizzo del computer")

// Integrazione syllabus: 1.1.1
#lezione("ICT", "Tecnologie dell’Informazione e della Comunicazione")[
L’*ICT* (Information and Communication Technology) comprende le tecnologie che permettono di *raccogliere, elaborare, conservare e scambiare informazioni*.

Computer, smartphone, programmi e reti lavorano insieme per rendere possibili queste attività.

Quando scriviamo un documento, inviamo un messaggio o seguiamo una lezione online, stiamo utilizzando strumenti e servizi ICT.
]

// Integrazione syllabus: 1.1.2
#lezione("ICT", "Esempi nell’uso quotidiano")[
- *Servizi Internet*: cercare informazioni sul web, inviare una mail, partecipare a una videochiamata, usare un servizio online.
- *Tecnologie mobili*: usare uno smartphone o un tablet per comunicare, consultare una mappa o acquistare un biglietto.
- *Produttività di ufficio*: scrivere testi, fare calcoli con un foglio elettronico, preparare presentazioni.

Per organizzare una gita possiamo usare un foglio elettronico per i costi e una mail per comunicare il programma.
]

// 01. Intro al computer.pdf, pagina 1 — I computer oggi
#slide(titolo: "I computer oggi")[
  #riga(480, 314.983, 60, tinta: rosso, centro: true, ampiezza: 443.82)[#text(weight: "bold", "I computer oggi")]
]

// 02. Intro al computer.pdf, pagina 2 — Il computer / Questi sono / computer!
#slide(grafica: "assets/slide/introduzione-02.svg", titolo: "Il computer / Questi sono / computer!")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 221.172)[#text(weight: "bold", "Il computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 182.331)[#text(weight: "bold", "Alcuni esempi")]
  #riga(29.8, 528.275, 9.68, ampiezza: 170.755)[#text("IIS Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
  #riga(699.39, 221.805, 40, tinta: rosso, centro: true, ampiezza: 225.8)[#text(weight: "bold", "Questi sono ")]
  #riga(695.55, 264.685, 40, tinta: rosso, centro: true, ampiezza: 192.6)[#text(weight: "bold", "computer!")]
]

// 03. Intro al computer.pdf, pagina 3 — Ma anche questi / sono computer! / Il computer
#slide(grafica: "assets/slide/introduzione-03.svg", titolo: "Ma anche questi / sono computer! / Il computer")[
  #riga(480, 115.79, 27, centro: true, ampiezza: 182.331)[#text(weight: "bold", "Alcuni esempi")]
  #riga(29.8, 528.275, 9.68, ampiezza: 170.755)[#text("IIS Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
  #riga(242.673, 243.205, 40, tinta: rosso, centro: true, ampiezza: 305.88)[#text(weight: "bold", "Ma anche questi ")]
  #riga(238.833, 286.085, 40, tinta: rosso, centro: true, ampiezza: 289.52)[#text(weight: "bold", "sono computer!")]
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 221.172)[#text(weight: "bold", "Il computer")]
]

// 04. Intro al computer.pdf, pagina 4 — Il computer
#slide(grafica: "assets/slide/introduzione-04.svg", titolo: "Il computer")[
  #riga(480, 115.79, 27, centro: true, ampiezza: 120.258)[#text(weight: "bold", "Tipologie")]
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 221.172)[#text(weight: "bold", "Il computer")]
  #riga(204.386, 162, 15, ampiezza: 693.912)[#text(weight: "bold", "I COMPUTER")#text(" ")#text(weight: "bold", "DESKTOP")#text(" (chiamati anche computer fissi) vengono chiamati così proprio perché ")]
  #riga(204.386, 182, 15, ampiezza: 693.912)[#text("sono progettati per poter essere posizionati su una scrivania o su un tavolo. I PC, in generale, ")]
  #riga(204.386, 202, 15, ampiezza: 610.185)[#text("offrono delle prestazioni mediamente superiori rispetto alle altre tipologie di computer.")]
  #riga(209.386, 257.663, 15, ampiezza: 693.921)[#text(weight: "bold", "I COMPUTER")#text(" ")#text(weight: "bold", "PORTATILI")#text(" (chiamati anche semplicemente notebook o laptop) sono dei computer ")]
  #riga(209.386, 277.663, 15, ampiezza: 693.921)[#text("di dimensioni ridotte proprio per poter essere facilmente trasportati ovunque (infatti sono dotati ")]
  #riga(209.386, 297.663, 15, ampiezza: 192.105)[#text("di una batteria ricaricabile).")]
  #riga(209.386, 347.775, 15, ampiezza: 693.911)[#text(weight: "bold", "GLI")#text(" ")#text(weight: "bold", "SMARTPHONE")#text(" non sono altro che dei telefoni cellulari dotati di uno schermo touchscreen ")]
  #riga(209.386, 367.775, 15, ampiezza: 693.915)[#text("nonché di funzionalità proprie dei computer. Con uno smartphone è possibile infatti effettuare ")]
  #riga(209.386, 387.775, 15, ampiezza: 693.924)[#text("delle telefonate, navigare su Internet, inviare e/o ricevere dei messaggi di testo o di posta ")]
  #riga(209.386, 407.775, 15, ampiezza: 113.355)[#text("elettronica, ecc.")]
  #riga(204.386, 452.596, 15, ampiezza: 616.41)[#text(weight: "bold", "I TABLET")#text(" sono dei dispositivi dotati di caratteristiche hardware e software proprie degli ")]
  #riga(204.386, 472.596, 15, ampiezza: 586.065)[#text("smartphone che, a seconda dei casi, consentono o meno di sostituire un computer ")]
  #riga(204.386, 492.596, 15, ampiezza: 63.345)[#text("portatile.")]
  #riga(29.8, 528.275, 9.68, ampiezza: 170.755)[#text("IIS Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// Integrazione syllabus: 1.2.1
#lezione("Dispositivi elettronici", "Lettori multimediali e fotocamere")[
I *lettori multimediali* sono dispositivi progettati per riprodurre contenuti come musica e video. Possono conservarli nella propria memoria o riceverli da altri dispositivi e servizi.

Le *fotocamere digitali* acquisiscono immagini e video tramite un sensore e li memorizzano in formato digitale, spesso su una scheda di memoria.

Anche uno smartphone può svolgere queste funzioni. La differenza è che un dispositivo dedicato è progettato principalmente per un certo utilizzo.
]

// 10. Intro al computer.pdf, pagina 10 — Software e Hardware
#slide(grafica: "assets/slide/introduzione-10.svg", titolo: "Software e Hardware")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 402.486)[#text(weight: "bold", "Software e Hardware")]
  #riga(29.8, 528.275, 9.68, ampiezza: 170.755)[#text("IIS Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
  #riga(41.476, 181.475, 17.5, ampiezza: 100.328)[#text(weight: "bold", "HARDWARE ")]
  #riga(41.476, 200.31, 17.5, ampiezza: 412.802)[#text("Per HARDWARE (HW) si intende tutto ciò che ")]
  #riga(41.476, 223.81, 17.5, ampiezza: 412.802)[#text("riguarda il computer e che è tangibile, materiale, ")]
  #riga(41.476, 247.31, 17.5, ampiezza: 412.8)[#text("che ha un peso fisico. In sostanza è l’insieme ")]
  #riga(41.476, 270.81, 17.5, ampiezza: 412.798)[#text("delle componenti fisiche (meccaniche, elettriche, ")]
  #riga(41.476, 294.31, 17.5, ampiezza: 412.78)[#text("elettroniche, magnetiche e ottiche) che ")]
  #riga(41.476, 317.81, 17.5, ampiezza: 221.568)[#text("costituiscono l’elaboratore.")]
  #riga(507.71, 181.548, 17.5, ampiezza: 96.443)[#text(weight: "bold", "SOFTWARE ")]
  #riga(507.71, 200.383, 17.5, ampiezza: 412.793)[#text("Per SOFTWARE (SW) si intende tutto ciò che c’è ")]
  #riga(507.71, 223.883, 17.5, ampiezza: 412.797)[#text("ma non è tangibile. È la parte invisibile di un ")]
  #riga(507.71, 247.383, 17.5, ampiezza: 412.8)[#text("elaboratore, costituita dai programmi residenti ")]
  #riga(507.71, 270.883, 17.5, ampiezza: 412.806)[#text("nella memoria del computer o nei supporti di ")]
  #riga(507.71, 294.383, 17.5, ampiezza: 138.757)[#text("memorizzazione.")]
]

// 11. Hardware.pdf, pagina 1 — Hardware
#slide(titolo: "Hardware")[
  #riga(480, 267.16, 58, tinta: rosso, centro: true, ampiezza: 261.58)[#text(weight: "bold", "Hardware")]
  #riga(480, 312.14, 32, centro: true, ampiezza: 469.184)[#text(weight: "bold", "Le componenti di un computer")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 18. Hardware.pdf, pagina 8 — Componenti di un computer
#slide(grafica: "assets/slide/hardware-08.svg", titolo: "Componenti di un computer")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 539.574)[#text(weight: "bold", "Componenti di un computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 55.971)[#text(weight: "bold", "CPU")]
  #riga(47, 196.268, 20, ampiezza: 500.02)[#text("La ")#text(weight: "bold", "CPU")#text(" (")#text(weight: "bold", "Central")#text(" ")#text(weight: "bold", "Processing")#text(" ")#text(weight: "bold", "Unit")#text(") o ")#text(weight: "bold", "processore")#text(", è il ")]
  #riga(47, 222.768, 20, ampiezza: 449.1)[#text(weight: "bold", "cervello")#text(" del ")#text(weight: "bold", "computer")#text(". E’ il componente che si ")]
  #riga(47, 249.268, 20, ampiezza: 256.12)[#text("occupa di eseguire calcoli. ")]
  #riga(47, 288.268, 20, ampiezza: 500.58)[#text("Ogni azione che un computer svolge, dall’apertura di ")]
  #riga(47, 314.768, 20, ampiezza: 420.04)[#text("un file alla riproduzione di un video, richiede ")]
  #riga(47, 341.268, 20, ampiezza: 416.2)[#text("l’esecuzione di istruzioni da parte della CPU. ")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 28. Hardware.pdf, pagina 18 — CPU
#slide(grafica: "assets/slide/hardware-18.svg", titolo: "CPU")[
  #riga(240, 82.84, 35, tinta: rosso, centro: true, ampiezza: 86.226)[#text(weight: "bold", "CPU")]
  #riga(240, 115.79, 27, centro: true, ampiezza: 241.272)[#text(weight: "bold", "Frequenza di clock")]
  #riga(54.5, 171.55, 15, ampiezza: 420.702)[#text("La frequenza di clock indica la ")#text(weight: "bold", "velocità")#text(" ")#text(weight: "bold", "con cui la CPU ")]
  #riga(54.5, 191.55, 15, ampiezza: 421.725)[#text(weight: "bold", "lavora")#text(". Più è alto il clock, più velocemente la CPU esegue ")]
  #riga(54.5, 211.55, 15, ampiezza: 98.115)[#text("le operazioni. ")]
  #riga(54.5, 246.55, 15, ampiezza: 421.723)[#text("L’unità di misura è l’")#text(weight: "bold", "Hertz")#text(" (")#text(weight: "bold", "Hz")#text("): oggi i processori normali ")]
  #riga(54.5, 266.55, 15, ampiezza: 421.719)[#text("hanno frequenze nell’ordine dei GHz -> 1.000.000.000 di ")]
  #riga(54.5, 286.55, 15, ampiezza: 117.51)[#text("cicli al secondo! ")]
  #riga(54.5, 321.55, 15, ampiezza: 421.738)[#text("Questi numeri possono sembrare enormi, ma sono ")]
  #riga(54.5, 341.55, 15, ampiezza: 421.721)[#text("necessari! Anche solo per ")#text(weight: "bold", "eseguire un’app")#text(", ")#text("il computer ")]
  #riga(54.5, 361.835, 15, ampiezza: 421.722)[#text("deve aggiornare continuamente lo schermo (i pixel che si ")]
  #riga(54.5, 381.835, 15, ampiezza: 421.725)[#text("accendono e si spengono) e nel frattempo gestire tante ")]
  #riga(54.5, 401.835, 15, ampiezza: 421.727)[#text("altre cose: “ascoltare” il touch o la tastiera, aggiornare la ")]
  #riga(54.5, 421.835, 15, ampiezza: 421.721)[#text("connessione a internet, ascoltare l’arrivo delle notifiche, ")]
  #riga(54.5, 441.835, 15, ampiezza: 233.445)[#text("aggiornare le app in background.")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 29. Hardware.pdf, pagina 19 — CPU
#slide(grafica: "assets/slide/hardware-19.svg", titolo: "CPU")[
  #riga(240, 82.84, 35, tinta: rosso, centro: true, ampiezza: 86.226)[#text(weight: "bold", "CPU")]
  #riga(240, 115.79, 27, centro: true, ampiezza: 62.613)[#text(weight: "bold", "Core")]
  #riga(58.619, 165.724, 16.5, ampiezza: 409.721)[#text("Una CPU dotata di un singolo core esegue un’unica ")]
  #riga(58.619, 187.224, 16.5, ampiezza: 409.735)[#text("operazione alla volta. Un core è un’unità di ")]
  #riga(58.619, 208.724, 16.5, ampiezza: 409.71)[#text("elaborazione indipendente all’interno della CPU. ")]
  #riga(58.619, 230.224, 16.5, ampiezza: 409.728)[#text("Quando un processore contiene ")#text(weight: "bold", "più core")#text(", può ")]
  #riga(58.619, 252.038, 16.5, ampiezza: 76.997)[#text("q u i n d i ")]
  #riga(155.355, 252.038, 16.5, ampiezza: 105.492)[#text(weight: "bold", "e s e g u i r e ")]
  #riga(280.589, 252.038, 16.5, ampiezza: 38.249)[#text(weight: "bold", "p i ù ")]
  #riga(338.581, 252.038, 16.5, ampiezza: 129.98)[#text(weight: "bold", "o p e r a z i o n i ")]
  #riga(58.619, 272.088, 16.5, ampiezza: 178.2)[#text(weight: "bold", "contemporaneamente")#text(" ")]
  #riga(58.619, 301.352, 16.5, ampiezza: 409.728)[#text("Oggi quasi tutti i processori sono ")#text(weight: "bold", "multi")#text(" ")#text(weight: "bold", "core")#text(". Si ")]
  #riga(58.619, 322.852, 16.5, ampiezza: 409.721)[#text("parla quindi di processori Dual (2), Quad (4), Octa ")]
  #riga(58.619, 344.352, 16.5, ampiezza: 68.327)[#text("(8) core. ")]
  #riga(58.619, 402.352, 16.5, ampiezza: 409.729)[#text("Spesso sono presenti ")#text(weight: "bold", "core differenziati")#text(", alcuni più ")]
  #riga(58.619, 423.852, 16.5, ampiezza: 409.725)[#text("potenti (per i compiti più pesanti: elaborazione ")]
  #riga(58.619, 445.352, 16.5, ampiezza: 409.728)[#text("grafiche 3D, montaggio video) e altri più efficienti ")]
  #riga(58.619, 466.852, 16.5, ampiezza: 409.731)[#text("per risparmiare energia (compiti più leggeri: ascolto ")]
  #riga(58.619, 488.352, 16.5, ampiezza: 266.64)[#text("musica, operazioni in background)")]
  #riga(487.385, 193.438, 15, ampiezza: 86.97)[#text(weight: "bold", "6-core CPU ")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 30. Hardware.pdf, pagina 20 — Memoria
#slide(titolo: "Memoria")[
  #riga(480, 314.983, 60, tinta: rosso, centro: true, ampiezza: 250.02)[#text(weight: "bold", "Memoria")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 20. Hardware.pdf, pagina 10 — Componenti di un computer
#slide(grafica: "assets/slide/hardware-10.svg", titolo: "Componenti di un computer")[
  #riga(51.165, 178.065, 20, ampiezza: 557.035)[#text("La ")#text(weight: "bold", "memoria")#text(" ")#text(weight: "bold", "centrale")#text(" è la ")#text(weight: "bold", "principale")#text(" del computer. Viene ")]
  #riga(51.165, 204.565, 20, ampiezza: 557.037)[#text("utilizzata per ")#text(weight: "bold", "memorizzare")#text(" i ")#text(weight: "bold", "dati")#text(" e i ")#text(weight: "bold", "programmi")#text(" ")]
  #riga(51.165, 231.065, 20, ampiezza: 557.037)[#text(weight: "bold", "attualmente")#text(" ")#text(weight: "bold", "in")#text(" ")#text(weight: "bold", "esecuzione")#text(". E’ una memoria ")#text(weight: "bold", "temporanea")#text(" ")]
  #riga(51.165, 257.565, 20, ampiezza: 557.032)[#text("il cui contenuto viene completamente cancellato quando ")]
  #riga(51.165, 284.065, 20, ampiezza: 206.7)[#text("si spegne il computer.")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 230.877)[#text(weight: "bold", "Memoria Centrale")]
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 539.574)[#text(weight: "bold", "Componenti di un computer")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 33. Hardware.pdf, pagina 23 — Memoria
#slide(grafica: "assets/slide/hardware-23.svg", titolo: "Memoria")[
  #riga(47, 171.475, 17.5, ampiezza: 470)[#text("La RAM (Random Access Memory) è una memoria ad accesso casuale.")]
  #riga(47, 190.475, 17.5, ampiezza: 360.238)[#text("Le sue caratteristiche sono:")]
  #riga(72, 207.475, 17.5, ampiezza: 438.523)[#text(weight: "bold", "•")#text(weight: "bold", " ")#text(weight: "bold", "tempo di accesso rapido")#text(" e garantisce alte ")]
  #riga(88.042, 230.975, 17.5, ampiezza: 99.453)[#text("prestazioni. ")]
  #riga(72, 266.975, 17.5, ampiezza: 438.507)[#text(weight: "bold", "•")#text(" ")#text("tutto il contenuto viene perso quando il computer ")]
  #riga(88.042, 290.475, 17.5, ampiezza: 317.293)[#text("viene spento, è una ")#text(weight: "bold", "memoria volatile")#text(". ")]
  #riga(47, 326.475, 17.5, ampiezza: 77.333)[#text(weight: "bold", "Esempio ")]
  #riga(47, 349.975, 17.5, ampiezza: 463.505)[#text("Se si sta scrivendo un testo con Word, il testo e ")]
  #riga(47, 373.475, 17.5, ampiezza: 463.509)[#text("l’applicazione stessa vengono salvati temporaneamente ")]
  #riga(47, 396.975, 17.5, ampiezza: 463.526)[#text("nella RAM. Quando si esegue l’operazione di ")]
  #riga(47, 420.475, 17.5, ampiezza: 463.511)[#text("salvataggio, il contenuto del file viene salvato all’interno ")]
  #riga(47, 443.975, 17.5, ampiezza: 300.458)[#text("della memoria seconda, non volatile.")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 181.035)[#text(weight: "bold", "Memoria RAM")]
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 172.494)[#text(weight: "bold", "Memoria")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 19. Hardware.pdf, pagina 9 — Componenti di un computer
#slide(titolo: "Componenti di un computer")[
  #riga(47, 171.475, 17.5, ampiezza: 870.636)[#text("La memoria secondaria è utilizzata per ")#text(weight: "bold", "memorizzare i dati ")#text("in modo")#text(weight: "bold", " permanente")#text(", cioè fino alla loro ")]
  #riga(47, 194.975, 17.5, ampiezza: 869.448)[#text("eventuale cancellazione. È caratterizzata da ")#text(weight: "bold", "grande capacità di archiviazione")#text(", ")#text(weight: "bold", "tempi di accesso più lenti ")]
  #riga(47, 218.475, 17.5, ampiezza: 870.637)[#text("rispetto alla memoria principale e ")#text(weight: "bold", "non volatilità")#text(", poiché i dati rimangono memorizzati anche dopo lo ")]
  #riga(47, 241.975, 17.5, ampiezza: 232.085)[#text("spegnimento del computer. ")]
  #riga(47, 288.975, 17.5, ampiezza: 474.18)[#text("Esistono ")#text(weight: "bold", "due principali tipologie")#text(" di memoria secondaria: ")]
  #riga(72, 324.975, 17.5, ampiezza: 201.244)[#text("•")#text(weight: "bold", " ")#text(weight: "bold", "HDD")#text(" (Hard Disk Drive) ")]
  #riga(72, 360.975, 17.5, ampiezza: 207.824)[#text("•")#text(weight: "bold", " ")#text(weight: "bold", "SSD")#text(" (Solid State Drive) ")]
  #riga(47, 432.975, 17.5, ampiezza: 870.635)[#text("Si può immaginare la memoria secondaria come un ")#text(weight: "bold", "magazzino")#text(", uno spazio molto grande in cui ")]
  #riga(47, 456.475, 17.5, ampiezza: 870.631)[#text("archiviare/salvare dati, file e programmi, mentre la memoria principale rappresenta il bancone di lavoro ")]
  #riga(47, 479.975, 17.5, ampiezza: 407.943)[#text("su cui i dati vengono elaborati temporaneamente.")]
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 539.574)[#text(weight: "bold", "Componenti di un computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 266.706)[#text(weight: "bold", "Memoria Secondaria")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 34. Hardware.pdf, pagina 24 — Memoria
#slide(grafica: "assets/slide/hardware-24.svg", titolo: "Memoria")[
  #riga(47, 170.096, 16.975, ampiezza: 183.619)[#text(weight: "bold", "Hard Disk Drive(HDD)")#text(" ")]
  #riga(47, 192.096, 16.975, ampiezza: 500.559)[#text("Gli Hard Disk funzionano grazie a ")#text(weight: "bold", "dischi magnetici rotanti ")#text("e ")]
  #riga(47, 214.096, 16.975, ampiezza: 500.55)[#text("parti meccaniche ")#text(weight: "bold", "mobili")#text(" (come le testine di lettura e ")]
  #riga(47, 236.096, 16.975, ampiezza: 500.561)[#text("scrittura), che li rendono più ")#text(weight: "bold", "lenti")#text(", ")#text(weight: "bold", "rumorosi")#text(" e soggetti a ")]
  #riga(47, 258.096, 16.975, ampiezza: 500.554)[#text(weight: "bold", "usura")#text(" o rottura. Offrono grande capacità di archiviazione a un ")]
  #riga(47, 280.096, 16.975, ampiezza: 500.555)[#text("costo molto contenuto e venivano utilizzati soprattutto negli ")]
  #riga(47, 302.096, 16.975, ampiezza: 100.153)[#text("anni passati")#text(". ")]
  #riga(47, 336.526, 16.975, ampiezza: 192.191)[#text(weight: "bold", "SSD (Solid State Drive)")#text(" ")]
  #riga(47, 358.526, 16.975, ampiezza: 500.559)[#text("Gli SSD utilizzano una ")#text(weight: "bold", "tecnologia più moderna")#text(", senza parti ")]
  #riga(47, 380.526, 16.975, ampiezza: 500.558)[#text("meccaniche e mobili, risultando molto più ")#text(weight: "bold", "compatti")#text(" (piccoli), ")]
  #riga(47, 402.526, 16.975, ampiezza: 500.553)[#text(weight: "bold", "veloci")#text(", ")#text(weight: "bold", "silenziosi")#text(" e resistenti. Oggi la quasi totalità dei ")]
  #riga(47, 424.526, 16.975, ampiezza: 500.562)[#text("computer moderni utilizza SSD al posto degli hard disk ")]
  #riga(47, 446.526, 16.975, ampiezza: 500.557)[#text("tradizionali, d’obbligo in dispositivi come smartphone, tablet e ")]
  #riga(47, 468.526, 16.975, ampiezza: 98.37)[#text("smartwatch.")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 266.706)[#text(weight: "bold", "Memoria Secondaria")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 172.494)[#text(weight: "bold", "Memoria")]
]

// Integrazione syllabus: 1.2.2
#lezione("Prestazioni del computer", "CPU, RAM e memoria di massa")[
Le prestazioni dipendono da *più componenti che lavorano insieme*.

- *CPU*: esegue le istruzioni. Contano la sua architettura, il clock e i core; più GHz da soli non bastano a confrontare processori diversi.
- *RAM*: contiene i dati e i programmi in uso. Se è insufficiente, lavorare con molte applicazioni aperte può rallentare il computer.
- *Memoria di massa*: conserva file e programmi. Un SSD, rispetto a un HDD, riduce in genere i tempi di avvio e di caricamento.
]

// 21. Hardware.pdf, pagina 11 — Componenti di un computer
#slide(grafica: "assets/slide/hardware-11.svg", titolo: "Componenti di un computer")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 539.574)[#text(weight: "bold", "Componenti di un computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 244.566)[#text(weight: "bold", "Periferiche di input")]
  #riga(75.884, 180.027, 17.5, ampiezza: 808.833)[#text("Una periferica di input è qualsiasi dispositivo che permette al computer di ")#text(weight: "bold", "ricevere dati e comandi ")]
  #riga(75.884, 203.86, 17.5, ampiezza: 745.57)[#text(weight: "bold", "dall’esterno")#text(". Senza periferiche di input, il computer sarebbe come una scatola chiusa: ")#text(weight: "bold", "non ")]
  #riga(75.884, 227.692, 17.5, ampiezza: 545.177)[#text(weight: "bold", "riceverebbe alcuna informazione")#text(" e quindi non potrebbe fare nulla.")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 22. Hardware.pdf, pagina 12 — Componenti di un computer
#slide(grafica: "assets/slide/hardware-12.svg", titolo: "Componenti di un computer")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 539.574)[#text(weight: "bold", "Componenti di un computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 263.628)[#text(weight: "bold", "Periferiche di output")]
  #riga(75.884, 192.022, 17.5, ampiezza: 795.148)[#text("Una periferica di output è qualsiasi dispositivo che permette al computer di mostrare risultati e/o ")]
  #riga(75.884, 215.522, 17.5, ampiezza: 682.682)[#text("comunicare con l’esterno")#text(". Senza output, nessun risultato sarebbe visibile o utilizzabile.")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 23. Hardware.pdf, pagina 13 — Componenti di un computer
#slide(grafica: "assets/slide/hardware-13.svg", titolo: "Componenti di un computer")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 539.574)[#text(weight: "bold", "Componenti di un computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 339.984)[#text(weight: "bold", "Periferiche di input/output")]
  #riga(75.884, 180.027, 17.5, ampiezza: 785.698)[#text("Una periferica di input/output è un dispositivo con duplice funzione, permette di ")#text(weight: "bold", "ricevere dati e ")]
  #riga(75.884, 203.86, 17.5, ampiezza: 785.698)[#text(weight: "bold", "fornire risultati")#text(". È quindi necessario che svolga entrambe le funzioni: input e output.")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// Integrazione syllabus: 1.2.3
#lezione("Periferiche", "Integrate ed esterne")[
Una periferica può essere *integrata* nel dispositivo oppure *esterna*, collegata tramite un cavo o una connessione senza fili. La funzione rimane la stessa.

- *Tastiera, mouse e trackpad*: permettono di inserire testo, puntare e dare comandi. Il trackpad svolge la funzione del mouse nei portatili.
- *Webcam e microfono*: acquisiscono immagini, video e suoni.
- *Schermo e altoparlanti*: restituiscono immagini e suoni.
- *Scanner e stampante*: il primo acquisisce un documento su carta, la seconda produce una copia su carta.
]

// Integrazione syllabus: 1.2.3
#lezione("Periferiche", "Docking station")[
Una *docking station* è una base che permette di collegare un portatile a più periferiche attraverso un unico collegamento al computer.

Può mettere a disposizione porte per monitor, tastiera, mouse, rete e altri dispositivi. Nei modelli compatibili può anche alimentare e ricaricare il portatile.

*Esempio*: arrivo alla scrivania, collego il portatile alla docking station e ritrovo schermo, tastiera e mouse già pronti. Quando esco, scollego il computer senza staccare ogni periferica.
]

// 24. Hardware.pdf, pagina 14 — Componenti di un computer
#slide(grafica: "assets/slide/hardware-14.svg", titolo: "Componenti di un computer")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 539.574)[#text(weight: "bold", "Componenti di un computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 335.097)[#text(weight: "bold", "Interfacce e porte esterne")]
  #riga(83.412, 274.106, 15, ampiezza: 130.08)[#text(weight: "bold", "Esempi principali ")]
  #riga(96.412, 306.106, 15, ampiezza: 423.142)[#text("•")#text(" ")#text("USB (Type A, Type C): collegare tastiere, mouse, memorie ")]
  #riga(112.453, 326.106, 15, ampiezza: 396.525)[#text("esterne (chiavette), nei dispositivi mobili utilizzata come ")]
  #riga(112.453, 346.106, 15, ampiezza: 102)[#text("alimentazione ")]
  #riga(96.412, 378.106, 15, ampiezza: 400.027)[#text("•")#text(" ")#text("HDMI: collegare monitor o proiettori per video e audio ")]
  #riga(96.412, 410.106, 15, ampiezza: 279.922)[#text("•")#text(" ")#text("Ethernet: collegamento a reti cablate ")]
  #riga(96.412, 442.106, 15, ampiezza: 263.737)[#text("•")#text(" ")#text("Jack audio: uscita e ingresso audio ")]
  #riga(96.412, 474.106, 15, ampiezza: 446.662)[#text("•")#text(" ")#text("slot per schede SD, pulsanti di accensione, led di stato e altro")]
  #riga(84.11, 171.788, 17.5, ampiezza: 816.882)[#text("Le ")#text(weight: "bold", "interfacce")#text(" e le ")#text(weight: "bold", "porte")#text(" ")#text(weight: "bold", "esterne")#text(" permettono al computer di ")#text(weight: "bold", "comunicare con il mondo esterno")#text(", ")]
  #riga(84.11, 195.288, 17.5, ampiezza: 816.881)[#text("collegando ")#text(weight: "bold", "periferiche")#text(" di input e output, i ")#text(weight: "bold", "collegamenti")#text(" ")#text(weight: "bold", "di")#text(" ")#text(weight: "bold", "rete")#text(" e ")#text(weight: "bold", "sistemi")#text(" ")#text(weight: "bold", "di")#text(" ")#text(weight: "bold", "archiviazione")#text(". Le ")]
  #riga(84.11, 218.788, 17.5, ampiezza: 816.888)[#text("porte esterne sono i connettori fisici, mentre le interfacce sono le regole e i protocolli che ")]
  #riga(84.11, 242.288, 17.5, ampiezza: 452.795)[#text("permettono ai dispositivi di comunicare correttamente.")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// Integrazione syllabus: 1.2.4
#lezione("Porte di input/output", "USB e HDMI")[
La porta *USB* permette di collegare periferiche e trasferire dati. Può fornire anche alimentazione: ad esempio per una chiavetta, un mouse o la ricarica di un dispositivo.

*USB-A* e *USB-C* indicano forme diverse del connettore. Il connettore, da solo, non indica tutte le funzioni o la velocità disponibili.

La porta *HDMI* trasporta *video e audio digitali*. Si usa, ad esempio, per collegare un computer a un monitor, a un televisore o al proiettore della classe.
]

// 40. Software.pdf, pagina 1 — Software
#slide(titolo: "Software")[
  #riga(480, 267.16, 58, tinta: rosso, centro: true, ampiezza: 241.396)[#text(weight: "bold", "Software")]
  #riga(480, 312.14, 32, centro: true, ampiezza: 515.2)[#text(weight: "bold", "Il comportamento di un computer")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 41. Software.pdf, pagina 2 — Software
#slide(titolo: "Software")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 174.804)[#text(weight: "bold", "Software")]
  #riga(483.213, 115.768, 27, centro: true, ampiezza: 441.126)[#text(weight: "bold", "Il comportamento di un computer ")]
  #riga(85.759, 180.449, 17.5, ampiezza: 716.864)[#text("•")#text(" ")#text("Tutto ciò che in un computer è non fisico e non tangibile prende il nome di software.  ")]
  #riga(85.759, 216.449, 17.5, ampiezza: 756.099)[#text("•")#text(" ")#text("Il software da al computer un comportamento e uno scopo ed è costituito dai programmi. ")]
  #riga(85.759, 252.449, 17.5, ampiezza: 776.837)[#text("•")#text(" ")#text("In ogni computer, vi è una netta ")#text(weight: "bold", "separazione")#text(" tra la macchina fisica, l’")#text(weight: "bold", "hardware")#text(", dal ")]
  #riga(101.801, 275.949, 17.5, ampiezza: 463.452)[#text("programma che la macchina sta eseguendo, il ")#text(weight: "bold", "software.")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 43. Software.pdf, pagina 4 — Software
#slide(grafica: "assets/slide/software-04.svg", titolo: "Software")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 174.804)[#text(weight: "bold", "Software")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 150.498)[#text(weight: "bold", "Programma")]
  #riga(51.745, 180.48, 17.5, ampiezza: 868.105)[#text("Un programma è un ")#text(weight: "bold", "insieme di istruzioni")#text(", ")#text(weight: "bold", "leggibili")#text(" da un computer, per ")#text(weight: "bold", "risolvere")#text(" in maniera ")#text(weight: "bold", "automatica")#text(" ")]
  #riga(51.745, 203.98, 17.5, ampiezza: 161.7)[#text("un certo problema. ")]
  #riga(51.745, 250.98, 17.5, ampiezza: 872.585)[#text("I programmi sono scritti in un certo ")#text(weight: "bold", "linguaggio di programmazione")#text(", specificatamente pensato per essere ")]
  #riga(51.745, 274.48, 17.5, ampiezza: 210.665)[#text("capito da una macchina.  ")]
  #riga(51.745, 310.48, 17.5, ampiezza: 716.17)[#text(weight: "bold", "Programmare")#text(" significa scrivere il codice di un programma, chiamato ")#text(weight: "bold", "codice sorgente")#text(".")]
  #riga(137.056, 482.881, 20.5, ampiezza: 146.866)[#text(weight: "bold", "50 ")#text(size: 16.5pt, "milioni di righe")]
  #riga(721.049, 482.881, 20.5, ampiezza: 127.981)[#text(weight: "bold", "500 ")#text(size: 16.5pt, " mila righe")]
  #riga(76.45, 373.067, 17.5, ampiezza: 126.262)[#text(weight: "bold", "Linee di codice")]
  #riga(432.603, 482.881, 20.5, ampiezza: 146.149)[#text(weight: "bold", "36 ")#text(size: 16.5pt, "milioni di righe")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 44. Software.pdf, pagina 5 — Software
#slide(grafica: "assets/slide/software-05.svg", titolo: "Software")[
  #riga(527.058, 224.842, 17.325, ampiezza: 385.859)[#text("Tutti i software (programmi) che permettono di ")]
  #riga(527.058, 247.842, 17.325, ampiezza: 275.658)[#text("svolgere attività utili per gli utenti ")]
  #riga(549.058, 283.217, 17.325, ampiezza: 234.887)[#text("•")#text(" ")#text("Scrivere testi, mail, codice ")]
  #riga(549.058, 318.592, 17.325, ampiezza: 230.088)[#text("•")#text(" ")#text("Ascoltare musica, giocare ")]
  #riga(549.058, 353.967, 17.325, ampiezza: 239.703)[#text("•")#text(" ")#text("Andare sulla luna (davvero) ")]
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 174.804)[#text(weight: "bold", "Software")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 504.495)[#text(weight: "bold", "Software di base e software applicativo")]
  #riga(250.596, 182.928, 25, centro: true, ampiezza: 198.675)[#text(weight: "bold", "Software di base")]
  #riga(717.694, 182.928, 25, centro: true, ampiezza: 249.275)[#text(weight: "bold", "Software Applicativo")]
  #riga(68.7, 225.302, 17.5, ampiezza: 368.427)[#text("Tutto il software che serve a far funzionare il ")]
  #riga(68.7, 248.802, 17.5, ampiezza: 85.207)[#text("computer ")]
  #riga(90.7, 284.802, 17.5, ampiezza: 214.142)[#text("•")#text(" ")#text("BIOS/UEFI (accensione) ")]
  #riga(90.7, 320.802, 17.5, ampiezza: 163.794)[#text("•")#text(" ")#text("Sistema operativo")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 45. Software.pdf, pagina 6 — Sistema operativo
#slide(titolo: "Sistema operativo")[
  #riga(480, 267.16, 58, tinta: rosso, centro: true, ampiezza: 477.978)[#text(weight: "bold", "Sistema operativo")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 46. Software.pdf, pagina 7 — Sistema operativo
#slide(grafica: "assets/slide/software-07.svg", titolo: "Sistema operativo")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 346.122)[#text(weight: "bold", "Sistema operativo")]
  #riga(480, 115.768, 27, centro: true, ampiezza: 481.005)[#text(weight: "bold", "Funzioni principali e astrazioni fornite")]
  #riga(235.41, 337.059, 15, ampiezza: 159.48)[#text("Esegue le applicazioni ")]
  #riga(313.162, 368.259, 25, tinta: rosso, centro: true, ampiezza: 97.225)[#text(weight: "bold", "Processi")]
  #riga(510.675, 337.059, 15, ampiezza: 259.89)[#text("Fa dialogare applicazioni e hardware ")]
  #riga(638.633, 368.259, 25, tinta: rosso, centro: true, ampiezza: 130.25)[#text(weight: "bold", "System call")]
  #riga(62.777, 433.542, 15, ampiezza: 173.805)[#text("Salvare e recuperare file ")]
  #riga(76.165, 453.542, 15, ampiezza: 147.03)[#text("Gestisce la memoria ")]
  #riga(147.692, 484.742, 25, tinta: rosso, centro: true, ampiezza: 130.275)[#text(weight: "bold", "File System")]
  #riga(705.941, 434.386, 15, ampiezza: 202.335)[#text("Chi può accedere al sistema ")]
  #riga(756.266, 454.386, 15, ampiezza: 101.685)[#text("Cosa può fare ")]
  #riga(805.121, 485.586, 25, tinta: rosso, centro: true, ampiezza: 210.925)[#text(weight: "bold", "Utente / permesso")]
  #riga(416.385, 455.156, 15, ampiezza: 131.205)[#text("Naviga su internet ")]
  #riga(480, 486.357, 25, tinta: rosso, centro: true, ampiezza: 52.8)[#text(weight: "bold", "Rete")]
  #riga(38.801, 164.772, 17.5, ampiezza: 887.03)[#text("Il sistema operativo è il software di base che si frappone tra l’hardware e le applicazioni. Permette di ")]
  #riga(38.801, 188.272, 17.5, ampiezza: 887.035)[#text("eseguire programmi, anche in contemporanea, questa proprietà viene chiamata ")#text(weight: "bold", "multitasking")#text(". Controlla ")]
  #riga(38.801, 211.772, 17.5, ampiezza: 885.845)[#text(weight: "bold", "chi può accedere ")#text("al sistema (utenti autorizzati) e ")#text(weight: "bold", "che cosa si può fare")#text(" (permessi). Permette di ")#text(weight: "bold", "utilizzare la ")]
  #riga(38.801, 235.272, 17.5, ampiezza: 887.035)[#text(weight: "bold", "memoria secondaria")#text(", tramite un sistema di file e cartelle (file system). Permette di ")#text(weight: "bold", "comunicare")#text(" con il resto ")]
  #riga(38.801, 258.772, 17.5, ampiezza: 240.31)[#text("del mondo attraverso la rete. ")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// Integrazione syllabus: 1.3.2
#lezione("Sistema operativo", "Alcuni esempi")[
Il *sistema operativo* gestisce le risorse del dispositivo e fornisce gli strumenti per eseguire le applicazioni.

- Nei *computer desktop e portatili* troviamo sistemi come Windows, macOS e le distribuzioni GNU/Linux, ad esempio Ubuntu.
- Negli *smartphone e tablet* troviamo sistemi come Android, iOS e iPadOS.

Un’applicazione deve essere compatibile con il sistema operativo e con il dispositivo su cui viene eseguita. Per questo un programma per Windows non si installa automaticamente su un telefono Android.
]

// 48. Software.pdf, pagina 9 — Software applicativo
#slide(titolo: "Software applicativo")[
  #riga(480, 267.16, 58, tinta: rosso, centro: true, ampiezza: 544.504)[#text(weight: "bold", "Software applicativo")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 49. Software.pdf, pagina 10 — Software applicativo
#slide(grafica: "assets/slide/software-10.svg", titolo: "Software applicativo")[
  #riga(38.801, 164.772, 17.5, ampiezza: 566.23)[#text("È il software che serve all’utente finale per fare qualcosa di concreto. ")]
  #riga(38.801, 200.772, 17.5, ampiezza: 893.997)[#text("Viene sempre eseguito dal sistema operativo, non comunica direttamente con l’hardware o la rete. Il S.O. ")]
  #riga(38.801, 224.272, 17.5, ampiezza: 894.005)[#text("fornisce gli strumenti, il software applicativo li usa per realizzare un obiettivo (scrittura di documenti, ")]
  #riga(38.801, 247.772, 17.5, ampiezza: 375.585)[#text("navigazione online, messaggistica, gaming…) ")]
  #riga(38.801, 283.772, 17.5, ampiezza: 894.005)[#text("Un software applicativo è sempre scritto per una certa tipologia di sistema operativo, ecco perchè quando ")]
  #riga(38.801, 307.272, 17.5, ampiezza: 585.988)[#text("scarichiamo un software ci viene sempre chiesto per quale piattaforma!")]
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 394.296)[#text(weight: "bold", "Software applicativo")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 152.199)[#text(weight: "bold", "Panoramica")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// Integrazione syllabus: 1.3.3
#lezione("Software applicativo", "Ufficio e comunicazione")[
Le applicazioni permettono all’utente di svolgere *attività concrete*.

- *Suite di produttività di ufficio*: raccolgono programmi per testi, fogli elettronici e presentazioni. Esempi: Microsoft 365, LibreOffice e Google Workspace.
- *Comunicazione*: programmi per posta elettronica, messaggistica e videochiamate.
- *Reti sociali*: applicazioni e servizi per pubblicare contenuti, seguire persone e interagire con una comunità.

Uno stesso dispositivo può essere utilizzato per scrivere una relazione, inviarla e discuterla in videochiamata.
]

// Integrazione syllabus: 1.3.3
#lezione("Software applicativo", "Multimedia, design e app mobili")[
- *Elaborazione multimediale*: modificare foto, montare un video o registrare e modificare una traccia audio.
- *Design*: creare un disegno, un’impaginazione o un progetto tecnico, anche con programmi CAD.
- *App per dispositivi mobili*: applicazioni pensate per smartphone e tablet, ad esempio mappe, messaggistica, giochi e strumenti per studiare.

Il tipo di applicazione dipende dal *compito che vogliamo svolgere*. Lo stesso compito può essere svolto da più programmi, con strumenti e funzioni differenti.
]

// Integrazione syllabus: 1.3.1
#lezione("Software", "Installato localmente o disponibile online")[
Il software *locale* è installato sul dispositivo. Ad esempio, posso aprire un programma di scrittura già presente sul computer e lavorare a un documento anche senza Internet, se le sue funzioni lo consentono.

Il software *online* viene utilizzato attraverso Internet, spesso dal browser. Ad esempio, posso scrivere un documento condiviso senza installare sul computer l’intera applicazione.

Alcuni programmi combinano le due modalità. Lavorare online può richiedere una connessione e un account; alcune applicazioni offrono anche funzioni offline.
]

// Integrazione syllabus: 1.3.4
#lezione("Software e licenze", "EULA: il contratto con l’utente finale")[
L’*EULA* (End-User License Agreement) è il *contratto di licenza con l’utente finale*: descrive a quali condizioni possiamo usare un software.

Può indicare su quanti dispositivi installarlo, per quali utilizzi è consentito e quali limiti si applicano alla copia o alla distribuzione.

Prima dell’utilizzo dobbiamo avere una *licenza valida e rispettarne le condizioni*, anche quando il software è gratuito. Scaricare un programma o possedere una sua copia non significa poterlo utilizzare liberamente in qualsiasi modo.
]

// Integrazione syllabus: 1.3.5
#lezione("Software e licenze", "Proprietario e open source")[
Nel *software proprietario* il titolare stabilisce condizioni e limiti d’uso. In genere il codice sorgente non è disponibile per modificarlo e ridistribuirlo liberamente. Può essere a pagamento oppure gratuito.

Il software *open source* è distribuito con una licenza che permette di accedere al codice sorgente, usarlo, modificarlo e ridistribuirlo, rispettando le condizioni previste. Può essere usato anche per attività commerciali.

*Prezzo e licenza sono aspetti diversi*: “gratuito” riguarda il costo, “open source” riguarda anche i diritti concessi sul software.
]

// Integrazione syllabus: 1.3.5
#lezione("Software e licenze", "Freeware, versione di prova e shareware")[
- *Freeware*: software utilizzabile senza pagare il prezzo d’acquisto, alle condizioni della sua licenza. Non è necessariamente open source.
- *Versione di prova (trial)*: permette di valutare un programma per un periodo o con funzioni limitate. Per continuare o sbloccare le funzioni può servire una licenza a pagamento.
- *Shareware*: software distribuito per essere provato e condiviso, ma che richiede un pagamento per continuare a usarlo secondo le condizioni previste.

Queste categorie possono sovrapporsi: una versione di prova può essere software proprietario.
]

// Apertura: 1.4
#apertura("Avvio e spegnimento", "Dall’accensione alla chiusura della sessione")

// Integrazione syllabus: 1.4.1
#lezione("Avvio del computer", "Accensione e accesso")[
Per usare un computer dobbiamo prima *accenderlo* e poi *accedere al nostro account*.

1. Se necessario, collegare l’alimentazione e accendere anche il monitor.
2. Premere una volta il pulsante di accensione del computer e attendere l’avvio del sistema operativo.
3. Selezionare il proprio account oppure inserire il *nome utente* richiesto.
4. Inserire la *password* e confermare l’accesso.

Il nome utente identifica l’account. La password permette di verificare che chi sta accedendo sia autorizzato a usarlo.
]

// Integrazione syllabus: 1.4.1, 1.4.2
#lezione("Accesso sicuro", "Il proprio account")[
Il computer della classe può essere usato da persone diverse. Ognuno deve accedere con il *proprio account* e le proprie credenziali.

- Digitare la password senza mostrarla o comunicarla agli altri.
- Verificare di aver selezionato l’account corretto prima di confermare l’accesso.
- Se ci si allontana, *bloccare la sessione*. Al termine del lavoro, scollegarsi dal proprio account.

Usare un computer condiviso non significa condividere la propria password o lasciare aperta la propria sessione.
]

// Integrazione syllabus: 1.4.2
#lezione("Fine della sessione", "Bloccare o scollegarsi")[
*Bloccare* protegge temporaneamente la sessione, mantenendo aperti i programmi. È utile quando ci allontaniamo per poco tempo. In Windows si può usare la combinazione *Windows + L*.

*Scollegarsi* (Esci, Disconnetti o logout) chiude la sessione dell’utente. Prima bisogna salvare i documenti: i programmi aperti vengono chiusi, mentre il computer resta acceso.

In Windows, per scollegarsi, aprire *Start*, selezionare l’icona del proprio account e scegliere *Disconnetti*. Uscire da un sito nel browser non equivale a uscire dall’account del computer.
]

// Integrazione syllabus: 1.4.2
#lezione("Spegnimento e riavvio", "La procedura corretta")[
Prima di terminare il lavoro, *salvare i documenti* e chiudere le applicazioni.

- *Spegni / Arresta il sistema*: chiude la sessione e spegne il computer.
- *Riavvia*: chiude la sessione e avvia nuovamente il sistema operativo.

In Windows, aprire *Start*, selezionare il pulsante *Alimentazione* e scegliere *Arresta il sistema* oppure *Riavvia*. Attendere la conclusione della procedura.

Spegnere solo il monitor non spegne il computer. Togliere la corrente o tenere premuto il pulsante di accensione non è la normale procedura di spegnimento.
]

// Prova pratica syllabus: 1.4.1, 1.4.2
#lezione("Prova pratica", "Dall’accesso all’uscita")[
1. Accendere il computer e accedere con il proprio *nome utente e la propria password*, senza comunicarla agli altri.
2. *Bloccare la sessione* e rientrare nel proprio account. Che cosa è rimasto aperto?
3. Salvare l’eventuale lavoro, *scollegarsi* e accedere di nuovo. Che cosa cambia rispetto al blocco?
4. Usare il comando *Riavvia*, attendere il nuovo avvio e accedere. Infine usare *Arresta il sistema* e attendere lo spegnimento completo.

Durante la prova, distinguere quali operazioni chiudono la sessione e quali spengono anche il computer.
]
