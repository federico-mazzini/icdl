// Presentazione unica: Introduzione al computer, Hardware, Software.
// Modello: https://github.com/federico-mazzini/dispense-comunicazione/blob/main/styles/slides.typ
// Palette, carattere, formato 960 × 540, fregio e numerazione dal modello.
// Posizioni, interruzioni di riga, immagini e testi dai PDF in mie_slide/.
// Unico sorgente Typst: i file SVG contengono solo immagini, forme e diagrammi.
// Nessuna slide è incorporata come screenshot; tutti i testi estratti sono qui sotto.
// Compilazione: typst compile --root . "src/originali mie.typ" "dist/originali mie.pdf"

#let rosso = rgb("#c00000")
#let grigio = rgb("#555555")
#let larghezza = 864pt
#let altezza-corpo = 390pt
#let sfondo = rgb("#fbf4f3")

#let presentazione(body) = {
  set document(title: "Il computer: hardware e software", author: "Federico Mazzini")
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

#show: presentazione

// 01. Intro al computer.pdf, pagina 1 — I computer oggi
#slide(titolo: "I computer oggi")[
  #riga(480, 314.983, 60, tinta: rosso, centro: true, ampiezza: 443.82)[#text(weight: "bold", "I computer oggi")]
]

// 02. Intro al computer.pdf, pagina 2 — Il computer / Questi sono / computer!
#slide(grafica: "../assets/slide/introduzione-02.svg", titolo: "Il computer / Questi sono / computer!")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 221.172)[#text(weight: "bold", "Il computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 182.331)[#text(weight: "bold", "Alcuni esempi")]
  #riga(29.8, 528.275, 9.68, ampiezza: 170.755)[#text("IIS Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
  #riga(699.39, 221.805, 40, tinta: rosso, centro: true, ampiezza: 225.8)[#text(weight: "bold", "Questi sono ")]
  #riga(695.55, 264.685, 40, tinta: rosso, centro: true, ampiezza: 192.6)[#text(weight: "bold", "computer!")]
]

// 03. Intro al computer.pdf, pagina 3 — Ma anche questi / sono computer! / Il computer
#slide(grafica: "../assets/slide/introduzione-03.svg", titolo: "Ma anche questi / sono computer! / Il computer")[
  #riga(480, 115.79, 27, centro: true, ampiezza: 182.331)[#text(weight: "bold", "Alcuni esempi")]
  #riga(29.8, 528.275, 9.68, ampiezza: 170.755)[#text("IIS Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
  #riga(242.673, 243.205, 40, tinta: rosso, centro: true, ampiezza: 305.88)[#text(weight: "bold", "Ma anche questi ")]
  #riga(238.833, 286.085, 40, tinta: rosso, centro: true, ampiezza: 289.52)[#text(weight: "bold", "sono computer!")]
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 221.172)[#text(weight: "bold", "Il computer")]
]

// 04. Intro al computer.pdf, pagina 4 — Il computer
#slide(grafica: "../assets/slide/introduzione-04.svg", titolo: "Il computer")[
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

// 05. Intro al computer.pdf, pagina 5 — Il computer
#slide(grafica: "../assets/slide/introduzione-05.svg", titolo: "Il computer")[
  #riga(480, 115.79, 27, centro: true, ampiezza: 120.258)[#text(weight: "bold", "Tipologie")]
  #riga(29.8, 528.275, 9.68, ampiezza: 170.755)[#text("IIS Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 221.172)[#text(weight: "bold", "Il computer")]
  #riga(204.386, 162, 15, ampiezza: 693.915)[#text("LE ")#text(weight: "bold", "CONSOLE ")#text("sono particolari computer progettati principalmente per i videogiochi. Sono ")]
  #riga(204.386, 182, 15, ampiezza: 693.915)[#text("collegabile a un televisore o sono dotato di schermo integrato. Di solito hanno bisogno di un ")]
  #riga(204.386, 202, 15, ampiezza: 182.01)[#text(weight: "bold", "controller ")#text("per funzionare.")]
  #riga(209.386, 257.663, 15, ampiezza: 693.913)[#text("I ")#text(weight: "bold", "SERVER ")#text("sono speciali computer che forniscono servizi, dati o risorse ad altri computer ")]
  #riga(209.386, 277.663, 15, ampiezza: 693.908)[#text("attraverso la rete internet. I server permettono ad esempio di visitare le pagine web, guardare un ")]
  #riga(209.386, 297.663, 15, ampiezza: 328.62)[#text("film in streaming o utilizzare un social network.")]
  #riga(204.386, 361.583, 15, ampiezza: 693.911)[#text("I ")#text(weight: "bold", "DISPOSITIVI WEARABLE ")#text("sono dei piccoli computer che possono essere indossati, come ")]
  #riga(204.386, 381.583, 15, ampiezza: 693.915)[#text("smartwatch, auricolari e smartglasses. Di solito questi dispositivi hanno dei sensori per misurare ")]
  #riga(204.386, 401.583, 15, ampiezza: 518.445)[#text("alcuni parametri di chi li indossa (frequenza cardiaca, sonno, rumore, ecc)")]
  #riga(204.386, 451.269, 14.25, ampiezza: 693.71)[#text(weight: "bold", "I SISTEMI EMBEDDED ")#text("sono dei particolari computer inseriti all’interno di un dispositivo o un ")]
  #riga(204.386, 469.769, 14.25, ampiezza: 693.716)[#text("macchinario, progettato per svolgere funzioni specifiche. Il termine inglese embedded significa ")]
  #riga(204.386, 488.269, 14.25, ampiezza: 693.718)[#text("“incorporato\". Esempi di sistemi embedded sono lavatrici, forni a microonde e altre apparecchiature ")]
  #riga(204.386, 506.769, 14.25, ampiezza: 165.685)[#text("elettroniche e industriali.")]
]

// 06. Intro al computer.pdf, pagina 6 — Tipologie di computer
#slide(grafica: "../assets/slide/introduzione-06.svg", titolo: "Tipologie di computer")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 420.924)[#text(weight: "bold", "Tipologie di computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 242.082)[#text(weight: "bold", "Sistemi embedded")]
  #riga(29.8, 528.275, 9.68, ampiezza: 170.755)[#text("IIS Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
  #riga(41.476, 179.509, 17.5, ampiezza: 292.618)[#text(weight: "bold", "Un sistema embedded (o \"sistema ")]
  #riga(41.476, 203.009, 17.5, ampiezza: 382.042)[#text(weight: "bold", "incorporato\") ")#text("è un ")#text(weight: "bold", "piccolo")#text(" ")#text(weight: "bold", "computer")#text(" inserito ")]
  #riga(41.476, 226.509, 17.5, ampiezza: 360.815)[#text("dentro un altro dispositivo per svolgere una ")]
  #riga(41.476, 250.009, 17.5, ampiezza: 183.453)[#text("funzione ben ")#text(weight: "bold", "precisa")#text(".")#text(weight: "bold", " ")]
  #riga(41.476, 283.509, 17.5, ampiezza: 375.988)[#text("A differenza di un normale computer o di uno ")]
  #riga(41.476, 307.009, 17.5, ampiezza: 352.87)[#text("smartphone, che servono a fare tantissime ")]
  #riga(41.476, 330.509, 17.5, ampiezza: 314.072)[#text("cose diverse, un sistema embedded è ")]
  #riga(41.476, 354.009, 17.5, ampiezza: 363.51)[#text("programmato per svolgere ")#text(weight: "bold", "un solo compito ")]
  #riga(41.476, 377.509, 17.5, ampiezza: 88.498)[#text(weight: "bold", "specifico")#text(". ")]
]

// 07. Intro al computer.pdf, pagina 7 — Tipologie di computer
#slide(grafica: "../assets/slide/introduzione-07.svg", titolo: "Tipologie di computer")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 420.924)[#text(weight: "bold", "Tipologie di computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 242.082)[#text(weight: "bold", "Sistemi embedded")]
  #riga(29.8, 528.275, 9.68, ampiezza: 170.755)[#text("IIS Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
  #riga(41.476, 195.638, 17.5, ampiezza: 233.52)[#text(weight: "bold", "Esempi nell’uso quotidiano ")]
  #riga(63.476, 229.138, 17.5, ampiezza: 407.797)[#text("•")#text(weight: "bold", " ")#text(weight: "bold", "Elettrodomestici")#text(": lavatrici, forni a microonde e ")]
  #riga(79.518, 252.638, 17.5, ampiezza: 177.048)[#text("frigoriferi intelligenti. ")]
  #riga(63.476, 286.138, 17.5, ampiezza: 396.859)[#text("•")#text(weight: "bold", " ")#text(weight: "bold", "Automobili")#text(": controllo dei freni (ABS), airbag e ")]
  #riga(79.518, 309.638, 17.5, ampiezza: 174.738)[#text("gestione del motore. ")]
  #riga(63.476, 343.138, 17.5, ampiezza: 416.914)[#text("•")#text(weight: "bold", " ")#text(weight: "bold", "Dispositivi medici")#text(": pacemaker e macchinari per ")]
  #riga(79.518, 366.638, 17.5, ampiezza: 78.82)[#text("ospedali. ")]
  #riga(63.476, 400.138, 17.5, ampiezza: 361.807)[#text("•")#text(weight: "bold", " ")#text(weight: "bold", "Robotica")#text(": robot industriali nelle catene di ")]
  #riga(79.518, 423.638, 17.5, ampiezza: 98.823)[#text("montaggio. ")]
]

// 08. Intro al computer.pdf, pagina 8 — Tipologie di computer
#slide(grafica: "../assets/slide/introduzione-08.svg", titolo: "Tipologie di computer")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 420.924)[#text(weight: "bold", "Tipologie di computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 84.591)[#text(weight: "bold", "Server")]
  #riga(29.8, 528.275, 9.68, ampiezza: 170.755)[#text("IIS Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
  #riga(41.476, 179.509, 17.5, ampiezza: 381.868)[#text("Un ")#text(weight: "bold", "server")#text(" è un computer specializzato che ha ")]
  #riga(41.476, 203.009, 17.5, ampiezza: 319.567)[#text("il compito di memorizzare, elaborare e ")]
  #riga(41.476, 226.509, 17.5, ampiezza: 368.253)[#text("distribuire dati ad altri computer collegati su ")]
  #riga(41.476, 250.009, 17.5, ampiezza: 73.85)[#text("internet. ")]
  #riga(41.476, 283.509, 17.5, ampiezza: 340.865)[#text("Un server è ")#text(weight: "bold", "sempre")#text(" ")#text(weight: "bold", "acceso")#text(" e in attesa di ")]
  #riga(41.476, 307.009, 17.5, ampiezza: 359.468)[#text("esaudire le richieste di altri computer. Nella ")]
  #riga(41.476, 330.509, 17.5, ampiezza: 360.483)[#text("pratica quando navighiamo sul web, stiamo ")]
  #riga(41.476, 354.009, 17.5, ampiezza: 315.893)[#text("chiedendo i dati della pagina web che ")]
  #riga(41.476, 377.509, 17.5, ampiezza: 357.717)[#text("visualizziamo a un server. Per offrire questo ")]
  #riga(41.476, 401.009, 17.5, ampiezza: 378.035)[#text("servizio, i server sono accesi sempre 24 ore al ")]
  #riga(41.476, 424.509, 17.5, ampiezza: 107.888)[#text("giorno 7 su 7.")]
]

// 09. Intro al computer.pdf, pagina 9 — Tipologie di computer
#slide(titolo: "Tipologie di computer")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 420.924)[#text(weight: "bold", "Tipologie di computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 84.591)[#text(weight: "bold", "Server")]
  #riga(29.8, 528.275, 9.68, ampiezza: 170.755)[#text("IIS Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
  #riga(41.476, 173.294, 17.325, ampiezza: 231.185)[#text(weight: "bold", "Esempi nell’uso quotidiano ")]
  #riga(63.476, 206.194, 17.325, ampiezza: 711.203)[#text("•")#text(weight: "bold", " ")#text(weight: "bold", "Streaming e Social Media")#text(":")#text(weight: "bold", " ")#text("i video e le immagini che visualizziamo sui social media, o ")]
  #riga(79.358, 229.194, 17.325, ampiezza: 691.752)[#text("sulle piattaforme di streaming non sono memorizzati sul nostro dispositivo. Essi sono ")]
  #riga(79.358, 252.194, 17.325, ampiezza: 594.057)[#text("memorizzati in un server, di proprietà dell’azienda che fornisce il servizio.")#text(weight: "bold", " ")]
  #riga(63.476, 285.094, 17.325, ampiezza: 684.037)[#text("•")#text(weight: "bold", " ")#text(weight: "bold", "Gaming Online")#text(": nei giochi multiplayer online, un server centrale elabora in tempo ")]
  #riga(79.358, 308.094, 17.325, ampiezza: 644.663)[#text("reale le posizioni dei giocatori, i punteggi e le azioni di gioco, sincronizzando la ")]
  #riga(79.358, 331.094, 17.325, ampiezza: 61.279)[#text("partita.")#text(weight: "bold", " ")]
  #riga(63.476, 363.994, 17.325, ampiezza: 648.504)[#text("•")#text(weight: "bold", " ")#text(weight: "bold", "Cloud Storage (Google Drive, iCloud): ")#text(" quando salviamo un file nel cloud, ad ")]
  #riga(79.358, 386.994, 17.325, ampiezza: 674.324)[#text("esempio Google Drive, stiamo semplicemente salvando un file nella memoria di un ")]
  #riga(79.358, 409.994, 17.325, ampiezza: 221.587)[#text("altro computer (un server). ")]
  #riga(63.476, 442.894, 17.325, ampiezza: 695.541)[#text("•")#text(weight: "bold", " ")#text(weight: "bold", "Web e Email: ")#text("ogni sito web esistente è memorizzato su un server (Web Server). Allo ")]
  #riga(79.358, 465.894, 17.325, ampiezza: 659.944)[#text("stesso modo, l'invio e la ricezione di e-mail (Gmail, Outlook) è gestiti dai server di ")]
  #riga(79.358, 488.894, 17.325, ampiezza: 401.351)[#text("posta, che mandano le mail ai destinatari corretti.")]
]

// 10. Intro al computer.pdf, pagina 10 — Software e Hardware
#slide(grafica: "../assets/slide/introduzione-10.svg", titolo: "Software e Hardware")[
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

// 12. Hardware.pdf, pagina 2 — Architettura di Von Neumann
#slide(titolo: "Architettura di Von Neumann")[
  #riga(480, 314.983, 60, tinta: rosso, centro: true, ampiezza: 809.28)[#text(weight: "bold", "Architettura di Von Neumann")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 13. Hardware.pdf, pagina 3 — Architettura di Von Neumann
#slide(grafica: "../assets/slide/hardware-03.svg", titolo: "Architettura di Von Neumann")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 555.576)[#text(weight: "bold", "Architettura di Von Neumann")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 552.042)[#text(weight: "bold", "Funzionamento di un computer in generale")]
  #riga(47, 171.475, 17.5, ampiezza: 562.328)[#text("Possiamo schematizzare il lavoro di un computer nel modo seguente")]
  #riga(47, 376.459, 17.5, ampiezza: 686.893)[#text(weight: "bold", "Input")#text(": il computer riceve dati dall’esterno, ad esempio da tastiera, mouse o sensori. ")]
  #riga(47, 411.959, 17.5, ampiezza: 782.705)[#text(weight: "bold", "Elaborazione")#text(": i dati vengono processati dal processore, seguendo istruzioni memorizzate nella ")]
  #riga(47, 435.459, 17.5, ampiezza: 207.988)[#text("memoria (il programma). ")]
  #riga(47, 470.959, 17.5, ampiezza: 808.378)[#text(weight: "bold", "Output")#text(": viene elaborato un risultato e restituito in output, ad esempio mostrandolo sullo schermo, ")]
  #riga(47, 494.459, 17.5, ampiezza: 518.49)[#text("stampandolo su un foglio, salvandolo su un dispositivo esterno.")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 14. Hardware.pdf, pagina 4 — Architettura di Von Neumann
#slide(grafica: "../assets/slide/hardware-04.svg", titolo: "Architettura di Von Neumann")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 555.576)[#text(weight: "bold", "Architettura di Von Neumann")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 154.494)[#text(weight: "bold", "Idea di base")]
  #riga(47, 171.475, 17.5, ampiezza: 475.885)[#text("L’architettura di Von Neumann è il ")#text(weight: "bold", "modello alla base dei ")]
  #riga(47, 194.975, 17.5, ampiezza: 477.078)[#text(weight: "bold", "computer moderni")#text(". L’idea è quella di avere un unica ")]
  #riga(47, 218.475, 17.5, ampiezza: 477.078)[#text("memoria in cui vengono mantenuti sia i ")#text(weight: "bold", "dati")#text(" sia le ")]
  #riga(47, 241.975, 17.5, ampiezza: 196.962)[#text(weight: "bold", "istruzioni")#text(" (programmi). ")]
  #riga(47, 277.475, 17.5, ampiezza: 187.915)[#text("Componenti principali ")]
  #riga(72, 312.975, 17.5, ampiezza: 57.552)[#text(weight: "bold", "•")#text(weight: "bold", " ")#text(weight: "bold", "CPU ")]
  #riga(72, 348.475, 17.5, ampiezza: 171.109)[#text(weight: "bold", "•")#text(weight: "bold", " ")#text(weight: "bold", "Memoria centrale ")]
  #riga(72, 383.975, 17.5, ampiezza: 129.337)[#text(weight: "bold", "•")#text(weight: "bold", " ")#text(weight: "bold", "Input/output ")]
  #riga(72, 419.475, 17.5, ampiezza: 47.839)[#text(weight: "bold", "•")#text(weight: "bold", " ")#text(weight: "bold", "Bus")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 15. Hardware.pdf, pagina 5 — Componenti di un computer
#slide(titolo: "Componenti di un computer")[
  #riga(480, 314.983, 60, tinta: rosso, centro: true, ampiezza: 785.22)[#text(weight: "bold", "Componenti di un computer")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 16. Hardware.pdf, pagina 6 — Componenti di un computer
#slide(grafica: "../assets/slide/hardware-06.svg", titolo: "Componenti di un computer")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 539.574)[#text(weight: "bold", "Componenti di un computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 64.206)[#text(weight: "bold", "Case")]
  #riga(49.819, 194.914, 20, ampiezza: 670)[#text("Il ")#text(weight: "bold", "case ")#text("è il contenitore che ospita e protegge i componenti interni di un ")]
  #riga(49.819, 221.414, 20, ampiezza: 101.82)[#text("computer. ")]
  #riga(49.819, 259.914, 20, ampiezza: 184.44)[#text(weight: "bold", "Funzioni principali ")]
  #riga(64.819, 298.414, 20, ampiezza: 583.582)[#text("•")#text(weight: "bold", " ")#text(weight: "bold", "Protezione")#text(": protegge i componenti interni da polvere e urti  ")]
  #riga(64.819, 336.914, 20, ampiezza: 485.442)[#text("•")#text(weight: "bold", " ")#text(weight: "bold", "Struttura")#text(": tiene insieme tutti i componenti interni ")]
  #riga(64.819, 375.414, 20, ampiezza: 578.582)[#text("•")#text(weight: "bold", " ")#text(weight: "bold", "Accesso")#text(": permette di collegare dispositivi di input e output ")]
  #riga(64.819, 413.914, 20, ampiezza: 99.282)[#text(weight: "bold", "•")#text(weight: "bold", " ")#text(weight: "bold", "Estetica ")]
  #riga(46.773, 457.013, 17.5, ampiezza: 819.788)[#text("Nei portatili e smartphone non si parla sempre di ")#text(style: "italic", "case")#text(" ma di ")#text(style: "italic", "scocca")#text(" o ")#text(style: "italic", "cover")#text(". La funzione è la stessa: ")]
  #riga(46.773, 480.513, 17.5, ampiezza: 559.703)[#text("protezione + struttura + raffreddamento (anche se molto più ridotto).")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 17. Hardware.pdf, pagina 7 — Componenti di un computer
#slide(grafica: "../assets/slide/hardware-07.svg", titolo: "Componenti di un computer")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 539.574)[#text(weight: "bold", "Componenti di un computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 186.219)[#text(weight: "bold", "Scheda madre")]
  #riga(75.884, 181.752, 20, ampiezza: 786.16)[#text("La ")#text(weight: "bold", "scheda")#text(" ")#text(weight: "bold", "madre")#text(" è il cuore di ogni computer. Si tratta di una ")#text(weight: "bold", "piastra")#text(" ")#text(weight: "bold", "che raccoglie ")]
  #riga(75.884, 208.252, 20, ampiezza: 788.38)[#text(weight: "bold", "tutti i componenti principali ")#text("e li ")#text(weight: "bold", "collega")#text(" tra loro mediante collegamenti stampati di ")]
  #riga(75.884, 234.752, 20, ampiezza: 675)[#text("rame. A seconda del dispositivo, può essere di dimensioni molto diverse")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 18. Hardware.pdf, pagina 8 — Componenti di un computer
#slide(grafica: "../assets/slide/hardware-08.svg", titolo: "Componenti di un computer")[
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

// 20. Hardware.pdf, pagina 10 — Componenti di un computer
#slide(grafica: "../assets/slide/hardware-10.svg", titolo: "Componenti di un computer")[
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

// 21. Hardware.pdf, pagina 11 — Componenti di un computer
#slide(grafica: "../assets/slide/hardware-11.svg", titolo: "Componenti di un computer")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 539.574)[#text(weight: "bold", "Componenti di un computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 244.566)[#text(weight: "bold", "Periferiche di input")]
  #riga(75.884, 180.027, 17.5, ampiezza: 808.833)[#text("Una periferica di input è qualsiasi dispositivo che permette al computer di ")#text(weight: "bold", "ricevere dati e comandi ")]
  #riga(75.884, 203.86, 17.5, ampiezza: 745.57)[#text(weight: "bold", "dall’esterno")#text(". Senza periferiche di input, il computer sarebbe come una scatola chiusa: ")#text(weight: "bold", "non ")]
  #riga(75.884, 227.692, 17.5, ampiezza: 545.177)[#text(weight: "bold", "riceverebbe alcuna informazione")#text(" e quindi non potrebbe fare nulla.")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 22. Hardware.pdf, pagina 12 — Componenti di un computer
#slide(grafica: "../assets/slide/hardware-12.svg", titolo: "Componenti di un computer")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 539.574)[#text(weight: "bold", "Componenti di un computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 263.628)[#text(weight: "bold", "Periferiche di output")]
  #riga(75.884, 192.022, 17.5, ampiezza: 795.148)[#text("Una periferica di output è qualsiasi dispositivo che permette al computer di mostrare risultati e/o ")]
  #riga(75.884, 215.522, 17.5, ampiezza: 682.682)[#text("comunicare con l’esterno")#text(". Senza output, nessun risultato sarebbe visibile o utilizzabile.")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 23. Hardware.pdf, pagina 13 — Componenti di un computer
#slide(grafica: "../assets/slide/hardware-13.svg", titolo: "Componenti di un computer")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 539.574)[#text(weight: "bold", "Componenti di un computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 339.984)[#text(weight: "bold", "Periferiche di input/output")]
  #riga(75.884, 180.027, 17.5, ampiezza: 785.698)[#text("Una periferica di input/output è un dispositivo con duplice funzione, permette di ")#text(weight: "bold", "ricevere dati e ")]
  #riga(75.884, 203.86, 17.5, ampiezza: 717.063)[#text(weight: "bold", "fornire risultati")#text(". Qualsiasi dispositivo che permette al computer di mostrare risultati e/o ")]
  #riga(75.884, 227.692, 17.5, ampiezza: 539.052)[#text("comunicare con l’esterno è considerato periferica di input/output.")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 24. Hardware.pdf, pagina 14 — Componenti di un computer
#slide(grafica: "../assets/slide/hardware-14.svg", titolo: "Componenti di un computer")[
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

// 25. Hardware.pdf, pagina 15 — Componenti di un computer
#slide(titolo: "Componenti di un computer")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 539.574)[#text(weight: "bold", "Componenti di un computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 224.937)[#text(weight: "bold", "Altre componenti")]
  #riga(46.926, 218.921, 15, ampiezza: 390.132)[#text("La GPU è un processore aggiuntivo, dedicato ")]
  #riga(46.926, 238.921, 15, ampiezza: 390.123)[#text("all’elaborazione grafica. Può essere integrata nella CPU ")]
  #riga(46.926, 258.921, 15, ampiezza: 390.123)[#text("o presente come scheda dedicata per prestazioni ")]
  #riga(46.926, 278.921, 15, ampiezza: 53.07)[#text("migliori")]
  #riga(502.401, 218.921, 15, ampiezza: 390.123)[#text("L’alimentazione fornisce energia a tutti i componenti ")]
  #riga(502.401, 238.921, 15, ampiezza: 390.132)[#text("del computer, permettendo loro di funzionare ")]
  #riga(502.401, 258.921, 15, ampiezza: 390.12)[#text("correttamente. Si può suddividere tra alimentazione ")]
  #riga(502.401, 278.921, 15, ampiezza: 127.29)[#text("esterna e batteria.")]
  #riga(44.529, 356.683, 15, ampiezza: 379.971)[#text("Componenti che mantengono CPU e GPU a ")]
  #riga(44.529, 376.683, 15, ampiezza: 379.974)[#text("temperature sicure. Il raffreddamento può essere ad ")]
  #riga(44.529, 396.683, 15, ampiezza: 379.977)[#text("aria (ventole e dissipatori) o liquido. Senza dissipatori ")]
  #riga(44.529, 416.683, 15, ampiezza: 379.965)[#text("o ventole adeguate, CPU e GPU rischiano ")]
  #riga(44.529, 436.683, 15, ampiezza: 263.55)[#text("surriscaldamenti e malfunzionamenti.")]
  #riga(240, 185.205, 27, centro: true, ampiezza: 274.536)[#text(weight: "bold", "GPU (Scheda grafica)")]
  #riga(695.475, 185.205, 27, centro: true, ampiezza: 184.734)[#text(weight: "bold", "Alimentazione")]
  #riga(240, 322.967, 27, centro: true, ampiezza: 209.169)[#text(weight: "bold", "Raffreddamento")]
  #riga(695.475, 322.967, 27, centro: true, ampiezza: 240.624)[#text(weight: "bold", "Schede aggiuntive")]
  #riga(502.401, 360.109, 15, ampiezza: 390.126)[#text("Le schede aggiuntive servono a dotare il computer di ")]
  #riga(502.401, 380.109, 15, ampiezza: 390.123)[#text("funzionalità extra che non sono integrate nella scheda ")]
  #riga(502.401, 400.109, 15, ampiezza: 313.965)[#text("madre (audio, connessione Wi-Fi o Ethernet) ")]
  #riga(502.401, 427.609, 15, ampiezza: 390.129)[#text("Si collegano a slot appositi sulla scheda madre e ")]
  #riga(502.401, 447.609, 15, ampiezza: 390.114)[#text("permettono di personalizzare il PC in base alle ")]
  #riga(502.401, 467.609, 15, ampiezza: 66.36)[#text("esigenze.")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 26. Hardware.pdf, pagina 16 — CPU
#slide(titolo: "CPU")[
  #riga(480, 314.983, 60, tinta: rosso, centro: true, ampiezza: 124.38)[#text(weight: "bold", "CPU")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 27. Hardware.pdf, pagina 17 — CPU
#slide(grafica: "../assets/slide/hardware-17.svg", titolo: "CPU")[
  #riga(47.134, 196.763, 20, ampiezza: 524.363)[#text("La ")#text(weight: "bold", "CPU")#text(" è composta da ")#text(weight: "bold", "miliardi")#text(" ")#text(weight: "bold", "di")#text(" ")#text(weight: "bold", "transistor")#text(", piccoli ")]
  #riga(47.134, 223.263, 20, ampiezza: 524.36)[#text("interruttori elettronici che possono controllare il ")]
  #riga(47.134, 249.763, 20, ampiezza: 524.368)[#text("passaggio della corrente. I transistor vengono utilizzati ")]
  #riga(47.134, 276.263, 20, ampiezza: 447.7)[#text("per rappresentare le ")#text(weight: "bold", "informazioni")#text(" ")#text(weight: "bold", "binarie")#text(" 0 e 1.")]
  #riga(480, 81.21, 35, tinta: rosso, centro: true, ampiezza: 86.226)[#text(weight: "bold", "CPU")]
  #riga(480, 115.779, 27, centro: true, ampiezza: 184.788)[#text(weight: "bold", "Composizione")]
  #riga(47.134, 366.095, 20, ampiezza: 357.66)[#text(weight: "bold", "Evoluzione dimensioni dei transistor ")]
  #riga(47.134, 392.595, 20, ampiezza: 469.72)[#text(weight: "bold", "Anni ’50")#text(": circa 1cm (una moneta da 10 centesimi) ")]
  #riga(47.134, 431.595, 20, ampiezza: 556.28)[#text(weight: "bold", "Oggi 2025")#text(": su iPhone 17, un transistor è grande 3nm. Nello ")]
  #riga(47.134, 458.095, 20, ampiezza: 604.66)[#text("spessore di un capello (circa 0,06mm) stanno 20.000 transistor!")#text(weight: "bold", " ")]
  #riga(47.134, 484.595, 20, ampiezza: 465.64, url: "https://youtube.com/shorts/i2k6jHHzK4s?si=HOcS-HbGcrUk5KI3")[#text("Apple Microchip CPU Under Microscope, Youtube")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 28. Hardware.pdf, pagina 18 — CPU
#slide(grafica: "../assets/slide/hardware-18.svg", titolo: "CPU")[
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
#slide(grafica: "../assets/slide/hardware-19.svg", titolo: "CPU")[
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

// 31. Hardware.pdf, pagina 21 — Memoria
#slide(titolo: "Memoria")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 172.494)[#text(weight: "bold", "Memoria")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 120.258)[#text(weight: "bold", "Tipologie")]
  #riga(58.837, 173.426, 18.5, ampiezza: 567.95)[#text("All’interno di un computer esistono diverse ")#text(weight: "bold", "tipologie di memoria ")]
  #riga(83.837, 209.926, 18.5, ampiezza: 822.228)[#text("•")#text(weight: "bold", " ")#text(weight: "bold", "Memoria centrale")#text(": memoria ")#text(weight: "bold", "veloce ")#text("a ")#text(weight: "bold", "supporto della CPU")#text(". Contiene i dati e i programmi in ")]
  #riga(99.878, 234.426, 18.5, ampiezza: 806.183)[#text("uso in quel ")#text(weight: "bold", "momento")#text(". E’ una memoria ")#text(weight: "bold", "volatile")#text(", viene cancellata quando il computer viene ")]
  #riga(99.878, 258.926, 18.5, ampiezza: 806.189)[#text("spento. Rappresenta il piano di lavoro del computer, accesso veloce, ma spazio di lavoro ")]
  #riga(99.878, 283.426, 18.5, ampiezza: 75.055)[#text("limitato. ")]
  #riga(83.837, 319.926, 18.5, ampiezza: 822.229)[#text("•")#text(weight: "bold", " ")#text(weight: "bold", "Memoria secondaria")#text(": memoria ")#text(weight: "bold", "permanente")#text(", dove vengono conservati dati, programmi e ")]
  #riga(99.878, 344.777, 18.5, ampiezza: 806.189)[#text("sistema operativo anche quando il computer viene spento. Rappresenta il magazzino dove ")]
  #riga(99.878, 369.277, 18.5, ampiezza: 806.177)[#text("mantenere dati e programmi senza perderli, acceso più lento, ma spazio di deposito molto ")]
  #riga(99.878, 393.777, 18.5, ampiezza: 103.859)[#text("più grande. ")]
  #riga(83.837, 430.277, 18.5, ampiezza: 77.869)[#text(weight: "bold", "•")#text(weight: "bold", " ")#text(weight: "bold", "Cache ")]
  #riga(83.837, 466.777, 18.5, ampiezza: 146.134)[#text(weight: "bold", "•")#text(weight: "bold", " ")#text(weight: "bold", "Memoria ROM")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 32. Hardware.pdf, pagina 22 — Memoria
#slide(grafica: "../assets/slide/hardware-22.svg", titolo: "Memoria")[
  #riga(46.926, 212.334, 15, ampiezza: 389.104)[#text("La ")#text(weight: "bold", "capacità")#text(" indica la ")#text(weight: "bold", "quantità di dati che una ")]
  #riga(46.926, 232.334, 15, ampiezza: 390.123)[#text(weight: "bold", "memoria può contenere")#text(". L’unità di misura è il ")#text(weight: "bold", "byte ")#text("(e ")]
  #riga(46.926, 252.334, 15, ampiezza: 390.117)[#text("multipli kilo, mega, giga, tera…). Più è alta la capacità, ")]
  #riga(46.926, 272.334, 15, ampiezza: 310.23)[#text("più informazioni possono essere mantenuti. ")]
  #riga(46.926, 357.528, 15, ampiezza: 390.126)[#text("La ")#text(weight: "bold", "velocità")#text(" indica quanto rapidamente i dati possono ")]
  #riga(46.926, 377.528, 15, ampiezza: 390.114)[#text("essere letti e scritti all’interno della memoria. Si ")]
  #riga(46.926, 397.528, 15, ampiezza: 389.103)[#text("differenzia tra ")#text(weight: "bold", "velocità di lettura ")#text("(read)")#text(weight: "bold", " ")#text("e")#text(weight: "bold", " velocità di ")]
  #riga(46.926, 417.528, 15, ampiezza: 385.185)[#text(weight: "bold", "scrittura ")#text("(write). L’unità di misura è ")#text(weight: "bold", "byte/s ")#text("(e multipli).  ")]
  #riga(240, 185.205, 27, centro: true, ampiezza: 115.155)[#text(weight: "bold", "Capacità")]
  #riga(240, 322.967, 27, centro: true, ampiezza: 104.085)[#text(weight: "bold", "Velocità")]
  #riga(700.764, 257.499, 27, centro: true, ampiezza: 94.014)[#text(weight: "bold", "Esempi")]
  #riga(701.074, 294.875, 12.5, ampiezza: 49.013)[#text(weight: "bold", "Velocità")]
  #riga(824.886, 294.875, 12.5, ampiezza: 54.025)[#text(weight: "bold", "Capacità")]
  #riga(515.632, 321.518, 12.5, ampiezza: 120)[#text(weight: "bold", "Memoria principale ")]
  #riga(555.563, 338.518, 12.5, ampiezza: 37.362)[#text(weight: "bold", "(RAM)")]
  #riga(692.667, 330.018, 12.5, ampiezza: 66.325)[#text("20-30 GB/s")]
  #riga(829.38, 330.018, 12.5, ampiezza: 45.038)[#text("2‑64 GB")]
  #riga(512.594, 361.632, 12.5, ampiezza: 126.075)[#text(weight: "bold", "Memoria secondaria ")]
  #riga(534.301, 378.632, 12.5, ampiezza: 79.887)[#text(weight: "bold", "(veloce, SSD)")]
  #riga(702.924, 370.132, 12.5, ampiezza: 45.812)[#text("1-7 GB/s")]
  #riga(818.336, 370.132, 12.5, ampiezza: 67.125)[#text("128 GB‑2 TB")]
  #riga(512.594, 401.006, 12.5, ampiezza: 126.075)[#text(weight: "bold", "Memoria secondaria ")]
  #riga(537.695, 418.006, 12.5, ampiezza: 73.1)[#text(weight: "bold", "(lenta, HDD)")]
  #riga(684.849, 409.506, 12.5, ampiezza: 81.963)[#text("100-200 MB/s")]
  #riga(813.586, 401.006, 12.5, ampiezza: 79.938)[#text("500 GB‑10 TB ")]
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 172.494)[#text(weight: "bold", "Memoria")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 192.483)[#text(weight: "bold", "Caratteristiche")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 33. Hardware.pdf, pagina 23 — Memoria
#slide(grafica: "../assets/slide/hardware-23.svg", titolo: "Memoria")[
  #riga(47, 171.475, 17.5, ampiezza: 360.238)[#text("Le caratteristiche della memoria RAM sono: ")]
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

// 34. Hardware.pdf, pagina 24 — Memoria
#slide(grafica: "../assets/slide/hardware-24.svg", titolo: "Memoria")[
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

// 35. Hardware.pdf, pagina 25 — Memoria
#slide(grafica: "../assets/slide/hardware-25.svg", titolo: "Memoria")[
  #riga(47, 171.475, 17.5, ampiezza: 515.073)[#text("La memoria ")#text(weight: "bold", "cache")#text(" è una piccola memoria molto veloce, ")]
  #riga(47, 194.975, 17.5, ampiezza: 515.072)[#text("situata vicino alla CPU, usata per conservare dati e istruzioni ")]
  #riga(47, 218.475, 17.5, ampiezza: 186.375)[#text("utilizzati di frequente.  ")]
  #riga(72, 254.475, 17.5, ampiezza: 490.071)[#text("•")#text(" ")#text("prestazioni migliori rispetto alla memoria RAM. Riduce i ")]
  #riga(88.042, 277.975, 17.5, ampiezza: 440.72)[#text("tempi di accesso e migliora le prestazioni del sistema ")]
  #riga(72, 313.975, 17.5, ampiezza: 490.068)[#text("•")#text(" ")#text("capacità di memorizzazione molto limitata rispetto alla ")]
  #riga(88.042, 337.475, 17.5, ampiezza: 338.87)[#text("RAM, nell’ordine dei Kilobyte e Megabyte ")]
  #riga(47, 373.475, 17.5, ampiezza: 515.064)[#text("Quando la CPU deve reperire un’informazione, prima controlla ")]
  #riga(47, 396.975, 17.5, ampiezza: 515.076)[#text("se il dato è presente in cache, se non lo trova lo recupera dalla ")]
  #riga(47, 420.475, 17.5, ampiezza: 391.405)[#text("RAM e lo memorizza in cache per un uso futuro.")]
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 172.494)[#text(weight: "bold", "Memoria")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 82.782)[#text(weight: "bold", "Cache")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 36. Hardware.pdf, pagina 26 — Memoria
#slide(titolo: "Memoria")[
  #riga(47, 173.9, 20, ampiezza: 871.303)[#text("La ")#text(weight: "bold", "ROM")#text(" (Read Only Memory) è una memoria ")#text(weight: "bold", "non volatile ")#text("e in")#text(weight: "bold", " sola lettura")#text(", che mantiene i ")]
  #riga(47, 200.4, 20, ampiezza: 390.66)[#text("dati anche quando il computer è spento.  ")]
  #riga(72, 239.4, 20, ampiezza: 846.289)[#text("•")#text(" ")#text("Contiene istruzioni fisse e fondamentali per l’avvio del computer e per il suo corretto ")]
  #riga(90.333, 265.9, 20, ampiezza: 151.5)[#text("funzionamento. ")]
  #riga(72, 304.9, 20, ampiezza: 846.293)[#text("•")#text(" ")#text("Ogni volta che il computer viene acceso, il programma di avvio viene recuperato dalla ")]
  #riga(90.333, 331.4, 20, ampiezza: 61.94)[#text("ROM.  ")]
  #riga(72, 370.4, 20, ampiezza: 846.298)[#text("•")#text(" ")#text("Questa memoria viene definita dal produttore prima della vendita del computer e non ")]
  #riga(90.333, 396.9, 20, ampiezza: 253.3)[#text("può più  essere modificata.")]
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 172.494)[#text(weight: "bold", "Memoria")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 63.423)[#text(weight: "bold", "ROM")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 37. Hardware.pdf, pagina 27 — Capire memoria centrale / e secondaria
#slide(titolo: "Capire memoria centrale / e secondaria")[
  #riga(491.136, 197.66, 58, tinta: rosso, centro: true, ampiezza: 677.556)[#text(weight: "bold", "Capire memoria centrale  ")]
  #riga(480, 267.468, 58, tinta: rosso, centro: true, ampiezza: 338.372)[#text(weight: "bold", "e secondaria")]
  #riga(480, 312.14, 32, centro: true, ampiezza: 302.016)[#text(weight: "bold", "Attività dei pancake")]
  #riga(29.8, 528.275, 9.68, ampiezza: 229.3)[#text("IIS Alberghetti, Liceo Scientifico Scienze Applicate")]
  #riga(706.321, 528.275, 9.68, ampiezza: 223.879)[#text("2CLS e 2ELS a.s. 25/26    |    Prof. Federico Mazzini")]
]

// 38. Hardware.pdf, pagina 28 — Facciamo i pancake
#slide(grafica: "../assets/slide/hardware-28.svg", titolo: "Facciamo i pancake")[
  #riga(480, 59.757, 35, tinta: white, centro: true, ampiezza: 375.564)[#text(weight: "bold", "Facciamo i pancake")]
  #riga(29.8, 528.275, 9.68, tinta: white, ampiezza: 229.3)[#text("IIS Alberghetti, Liceo Scientifico Scienze Applicate")]
  #riga(706.321, 528.275, 9.68, tinta: white, ampiezza: 223.879)[#text("2CLS e 2ELS a.s. 25/26    |    Prof. Federico Mazzini")]
  #riga(21.539, 136.272, 15, tinta: white, ampiezza: 85.17)[#text(weight: "bold", "Ingredienti ")]
  #riga(43.539, 168.272, 15, tinta: white, ampiezza: 105.715)[#text("•")#text(" ")#text("250 ml Latte ")]
  #riga(43.539, 200.272, 15, tinta: white, ampiezza: 130.675)[#text("•")#text(" ")#text("200 g Farina 00 ")]
  #riga(43.539, 232.272, 15, tinta: white, ampiezza: 119.92)[#text("•")#text(" ")#text("65 g Zucchero ")]
  #riga(43.539, 264.272, 15, tinta: white, ampiezza: 58.3)[#text("•")#text(" ")#text("1 uovo")]
  #riga(636.179, 164.492, 15, tinta: white, ampiezza: 100.98)[#text(weight: "bold", "Preparazione ")]
  #riga(671.179, 196.492, 15, tinta: white, ampiezza: 9.915)[#text("1.")]
  #riga(696.7, 196.492, 15, tinta: white, ampiezza: 195.465)[#text("Mettere in una ciotola uovo ")]
  #riga(696.7, 216.492, 15, tinta: white, ampiezza: 245.895)[#text("insieme allo zucchero e mescolare ")]
  #riga(671.179, 248.492, 15, tinta: white, ampiezza: 12.39)[#text("2.")]
  #riga(696.7, 248.492, 15, tinta: white, ampiezza: 225.585)[#text("Aggiungere latte e continuare a ")]
  #riga(696.7, 268.492, 15, tinta: white, ampiezza: 76.905)[#text("mescolare ")]
  #riga(671.179, 300.492, 15, tinta: white, ampiezza: 12.99)[#text("3.")]
  #riga(696.7, 300.492, 15, tinta: white, ampiezza: 234.15)[#text("Aggiungere farina e continuare a ")]
  #riga(696.7, 320.492, 15, tinta: white, ampiezza: 76.905)[#text("mescolare ")]
  #riga(671.179, 352.492, 15, tinta: white, ampiezza: 13.335)[#text("4.")]
  #riga(696.7, 352.492, 15, tinta: white, ampiezza: 177.84)[#text("Finché impasto ha grumi ")]
  #riga(696.7, 372.492, 15, tinta: white, ampiezza: 76.905)[#text("mescolare ")]
  #riga(671.179, 404.492, 15, tinta: white, ampiezza: 12.435)[#text("5.")]
  #riga(696.7, 404.492, 15, tinta: white, ampiezza: 205.68)[#text("Mettere composto in padella ")]
  #riga(671.179, 436.492, 15, tinta: white, ampiezza: 13.14)[#text("6.")]
  #riga(696.7, 436.492, 15, tinta: white, ampiezza: 149.175)[#text("Cuocere per 4 minuti")]
  #riga(21.539, 387.224, 15, tinta: white, ampiezza: 73.305)[#text(weight: "bold", "Materiale ")]
  #riga(43.539, 419.224, 15, tinta: white, ampiezza: 67.885)[#text("•")#text(" ")#text("Ciotola ")]
  #riga(43.539, 451.224, 15, tinta: white, ampiezza: 68.17)[#text("•")#text(" ")#text("Padella ")]
  #riga(43.539, 483.224, 15, tinta: white, ampiezza: 56.89)[#text("•")#text(" ")#text("Frusta")]
]

// 39. Hardware.pdf, pagina 29 — Componenti di un computer
#slide(titolo: "Componenti di un computer")[
  #riga(29.8, 528.275, 9.68, ampiezza: 229.3)[#text("IIS Alberghetti, Liceo Scientifico Scienze Applicate")]
  #riga(706.321, 528.275, 9.68, ampiezza: 223.879)[#text("2CLS e 2ELS a.s. 25/26    |    Prof. Federico Mazzini")]
  #riga(79.603, 226.888, 17.5, ampiezza: 341.28)[#text("•")#text(" ")#text("Strumenti e materiali sparsi nella classe ")]
  #riga(79.603, 257.888, 17.5, ampiezza: 537.805)[#text("•")#text(" ")#text("Chi esegue la ricetta deve spostarsi per recuperare l’occorrente ")]
  #riga(79.603, 288.888, 17.5, ampiezza: 574.31)[#text("•")#text(" ")#text("Ricetta “in pausa” durante la ricerca degli ingredienti ")#text("→")#text(" molte attese")]
  #riga(236.832, 195.884, 26.88, tinta: rosso, centro: true, ampiezza: 366.939)[#text(weight: "bold", "Esecuzione ricetta prima volta")]
  #riga(240.826, 354.248, 25.2, tinta: rosso, centro: true, ampiezza: 374.926)[#text(weight: "bold", "Esecuzione ricetta seconda volta")]
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 539.574)[#text(weight: "bold", "Componenti di un computer")]
  #riga(480, 115.79, 27, centro: true, ampiezza: 376.731)[#text(weight: "bold", "Dividiamo la memoria perchè")]
  #riga(79.603, 388.139, 17.5, ampiezza: 343.117)[#text("•")#text(" ")#text("Strumenti e materiali sul piano di lavoro ")]
  #riga(79.603, 419.139, 17.5, ampiezza: 557.475)[#text("•")#text(" ")#text("Chi esegue la ricetta non si sposta e recupera tutto con una mano ")]
  #riga(79.603, 450.139, 17.5, ampiezza: 621.298)[#text("•")#text(" ")#text("Ricetta continua anche quando si prende un nuovo ingrediente/strumento")]
  #riga(751.131, 205.689, 25.2, tinta: rosso, angolo: 27.958deg, ampiezza: 161.191)[#text(weight: "bold", "Solo memoria ")]
  #riga(752.61, 236.872, 25.2, tinta: rosso, angolo: 27.958deg, ampiezza: 128.782)[#text(weight: "bold", "secondaria")]
  #riga(752.722, 366.571, 25.2, tinta: rosso, angolo: 27.958deg, ampiezza: 158.008)[#text(weight: "bold", "Con memoria ")]
  #riga(767.157, 404.63, 25.2, tinta: rosso, angolo: 27.958deg, ampiezza: 99.689)[#text(weight: "bold", "centrale")]
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

// 42. Software.pdf, pagina 3 — Software / I computer sono macchine universali
#slide(titolo: "Software / I computer sono macchine universali")[
  #riga(150.468, 402.599, 20, ampiezza: 663.002)[#text(weight: "bold", "Il comportamento di un computer è definito dalle istruzioni che la ")]
  #riga(150.468, 429.099, 20, ampiezza: 527.64)[#text(weight: "bold", "macchina segue, non da come è costruita fisicamente.")]
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 174.804)[#text(weight: "bold", "Software")]
  #riga(483.213, 115.768, 27, centro: true, ampiezza: 441.126)[#text(weight: "bold", "Il comportamento di un computer ")]
  #riga(480, 359.565, 40, tinta: rosso, centro: true, ampiezza: 668.12)[#text(weight: "bold", "I computer sono macchine universali")]
  #riga(85.759, 180.449, 17.5, ampiezza: 716.864)[#text("•")#text(" ")#text("Tutto ciò che in un computer è non fisico e non tangibile prende il nome di software.  ")]
  #riga(85.759, 216.449, 17.5, ampiezza: 756.099)[#text("•")#text(" ")#text("Il software da al computer un comportamento e uno scopo ed è costituito dai programmi. ")]
  #riga(85.759, 252.449, 17.5, ampiezza: 776.837)[#text("•")#text(" ")#text("In ogni computer, vi è una netta ")#text(weight: "bold", "separazione")#text(" tra la macchina fisica, l’")#text(weight: "bold", "hardware")#text(", dal ")]
  #riga(101.801, 275.949, 17.5, ampiezza: 463.452)[#text("programma che la macchina sta eseguendo, il ")#text(weight: "bold", "software.")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 43. Software.pdf, pagina 4 — Software
#slide(grafica: "../assets/slide/software-04.svg", titolo: "Software")[
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
#slide(grafica: "../assets/slide/software-05.svg", titolo: "Software")[
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
#slide(grafica: "../assets/slide/software-07.svg", titolo: "Sistema operativo")[
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

// 47. Software.pdf, pagina 8 — Sistema operativo
#slide(grafica: "../assets/slide/software-08.svg", titolo: "Sistema operativo")[
  #riga(480, 82.34, 35, tinta: rosso, centro: true, ampiezza: 346.122)[#text(weight: "bold", "Sistema operativo")]
  #riga(480, 115.768, 27, centro: true, ampiezza: 559.359)[#text(weight: "bold", "Gestione memoria secondaria: il file system")]
  #riga(38.801, 164.772, 17.5, ampiezza: 526.944)[#text("Il file system è il modo in cui il sistema operativo ")#text(weight: "bold", "organizza i ")]
  #riga(38.801, 188.272, 17.5, ampiezza: 528.146)[#text(weight: "bold", "dati ")#text("nella memoria secondaria. Il sistema operativo crea ")]
  #riga(38.801, 211.772, 17.5, ampiezza: 528.135)[#text("un’")#text(weight: "bold", "astrazione")#text(" (")#text(weight: "bold", "un modo di intendere la memoria")#text(") composta da ")]
  #riga(38.801, 235.272, 17.5, ampiezza: 114.52)[#text("file e cartelle. ")]
  #riga(38.801, 271.272, 17.5, ampiezza: 513.38)[#text("Tutti i ")#text(weight: "bold", "file e le cartelle")#text(" sono ")#text(weight: "bold", "organizzati")#text(" sotto forma di ")#text(weight: "bold", "albero")#text(". ")]
  #riga(38.801, 307.272, 17.5, ampiezza: 528.135)[#text("Ogni file e ogni cartella è sempre individuabile da uno specifico ")]
  #riga(38.801, 330.772, 17.5, ampiezza: 87.255)[#text(weight: "bold", "percorso")#text(". ")]
  #riga(38.801, 366.772, 17.5, ampiezza: 528.134)[#text("Nell’esempio di albero in figura, il file Grades è raggiungibile al ")]
  #riga(38.801, 390.272, 17.5, ampiezza: 416.832)[#text("percorso D:\\My Documents\\TEACHING\\")#text("105")#text("\\Grades")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 48. Software.pdf, pagina 9 — Software applicativo
#slide(titolo: "Software applicativo")[
  #riga(480, 267.16, 58, tinta: rosso, centro: true, ampiezza: 544.504)[#text(weight: "bold", "Software applicativo")]
  #riga(29.8, 528.275, 9.68, ampiezza: 156.758)[#text("Polo Tecnico Professionale di Lugo")]
  #riga(831.386, 528.275, 9.68, ampiezza: 98.813)[#text("Prof. Federico Mazzini")]
]

// 49. Software.pdf, pagina 10 — Software applicativo
#slide(grafica: "../assets/slide/software-10.svg", titolo: "Software applicativo")[
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
