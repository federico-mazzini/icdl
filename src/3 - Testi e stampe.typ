// Capitolo 3: Testi e stampe. Stile ripreso dalla presentazione 2.
// Fonte: Mario R. Storchi, ICDL Computer Essentials eBook, pp. 39–44.
// Immagini: © 2020 AICA & Edizioni Manna; estratte dall’ebook, senza ridisegno.
// Mappatura delle fonti: ../assets/ebook-capitolo-3/fonti.json.
// Le schermate e i programmi sono quelli dell’ambiente Windows descritto dal manuale.
#let rosso = rgb("#c00000")
#let grigio = rgb("#555555")
#let larghezza = 864pt
#let altezza-corpo = 390pt
#let sfondo = rgb("#fbf4f3")

#let presentazione(body) = {
  set document(title: "3 - Testi e stampe", author: "Federico Mazzini")
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
#let figura(nome, w, h) = image("../assets/ebook-capitolo-3/" + nome, width: w * 1pt, height: h * 1pt, fit: "contain")
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

#apertura("Testi e stampe", "Scrivere, salvare e stampare un documento")

// Ebook: pagine 39; syllabus: 3.1.1
#illustrazione("Blocco note", "Scrivere e leggere testi semplici", [
Il *Blocco note* permette di leggere e scrivere semplici file di testo, spesso con estensione *.txt*.

Per aprirlo, cercare *blocco note* dalla barra delle applicazioni oppure dal menu Start.

Il manuale lo mostra in *Accessori Windows*. Nel menu *Modifica* troviamo Taglia, Copia, Incolla ed Elimina.
], "p40-07.png")

// Ebook: pagine 39; syllabus: 3.1.1
#illustrazione("WordPad", "Un elaboratore di testi con formattazione", [
Nell’ambiente Windows del manuale è presente anche *WordPad*.

Permette di scegliere carattere, dimensione, colore e altre impostazioni del testo.

Si avvia cercando *wordpad* oppure da *Start → Accessori Windows → WordPad*.
], "p40-02.png")

// Ebook: pagine 39, 40; syllabus: 3.1.1
#lezione("Aprire un documento", "Ritrovare un file già salvato")[
1. Avviare l’applicazione di elaborazione testi.
2. Scegliere *File → Apri*.
3. Cercare il documento nella cartella o nell’unità che lo contiene.
4. Fare doppio clic sul file, oppure selezionarlo e premere *Apri*.

L’apertura permette di leggere e modificare un documento già esistente.
]

// Ebook: pagine 39, 40; syllabus: 3.1.1
#illustrazione("Chiudere un documento", "Decidere che cosa fare delle modifiche", [
Premere la *X* della finestra o scegliere il comando di uscita dal menu *File*.

Se ci sono modifiche non salvate:

- *Salva* le conserva nel file.
- *Non salvare* le scarta.
- *Annulla* torna al documento senza chiudere.
], "p40-06.png")

// Ebook: pagine 40; syllabus: 3.1.3
#lezione("Copiare il testo", "Ripetere una parte in un altro punto")[
1. Selezionare il testo.
2. Scegliere *Copia*.
3. Posizionare il cursore nel punto di destinazione.
4. Scegliere *Incolla*.

Il testo rimane anche nella posizione di partenza. Possiamo usare i pulsanti dell’applicazione, il menu *Modifica* o il menu del tasto destro.
]

// Ebook: pagine 41; syllabus: 3.1.3
#lezione("Spostare il testo", "Tagliare e incollare")[
1. Selezionare il testo da spostare.
2. Scegliere *Taglia*.
3. Posizionare il cursore nel punto di destinazione.
4. Scegliere *Incolla*.

La parte selezionata viene trasferita dalla posizione di partenza a quella nuova.
]

// Ebook: pagine 41; syllabus: 3.1.3
#lezione("Le scorciatoie per il testo", "Copia, taglia e incolla")[
- *Ctrl + C*: copia la selezione negli Appunti.
- *Ctrl + X*: taglia la selezione per spostarla.
- *Ctrl + V*: incolla il contenuto degli Appunti.

Nell’editor descritto dall’ebook si può anche trascinare il testo selezionato tenendo premuto *Ctrl* per copiarlo, oppure *Maiusc* per spostarlo. Questa modalità conserva il contenuto precedente degli Appunti.
]

// Ebook: pagine 41; syllabus: 3.1.3
#lezione("Lavorare tra documenti aperti", "Copiare o spostare da un file all’altro")[
Aprire il documento di partenza e quello di destinazione.

Nel primo documento, selezionare il testo e scegliere *Copia* oppure *Taglia*.

Passare al secondo documento, cliccare nel punto desiderato e scegliere *Incolla*.

Possiamo cambiare documento dalla *barra delle applicazioni*, lasciando aperte entrambe le finestre.
]

// Ebook: pagine 41; syllabus: 3.1.3
#lezione("Incollare un’immagine dello schermo", "Portare una cattura nel documento")[
Premendo *Stamp*, nell’ambiente descritto dal manuale, l’immagine dello schermo viene copiata negli *Appunti*.

Aprire un elaboratore di testi che supporta le immagini, come WordPad nell’ebook, e posizionare il cursore.

Scegliere *Incolla*: la cattura compare nel documento.

Salvare il documento per conservarla insieme al testo.
]

// Ebook: pagine 41, 42; syllabus: 3.1.4
#illustrazione("Salvare il documento", "Conservare il lavoro in un file", [
Salvare significa registrare il documento su un supporto di memoria, come il disco del computer o una chiavetta USB.

Con *File → Salva*, al primo salvataggio compare la finestra *Salva con nome*.

Scegliere la cartella, assegnare un nome significativo e premere *Salva*.
], "p42-01.png")

// Ebook: pagine 41, 42; syllabus: 3.1.4
#lezione("I salvataggi successivi", "Aggiornare il file durante il lavoro")[
Dopo il primo salvataggio, l’applicazione conosce già il nome e la posizione del documento.

Usando di nuovo *Salva*, il file viene aggiornato con le modifiche.

È utile salvare anche durante il lavoro, per esempio prima di una pausa: le modifiche ancora presenti solo nell’applicazione possono andare perse.
]

// Ebook: pagine 42; syllabus: 3.2.1
#illustrazione("Installare una stampante", "Consentire al computer di usarla", [
Collegare e accendere la stampante: Windows può riconoscerla e installarla automaticamente.

Se serve, aprire *Start → Impostazioni → Dispositivi → Stampanti e scanner*.

Scegliere *Aggiungi una stampante o uno scanner* per avviare la ricerca.
], "p43-02.png")

// Ebook: pagine 43; syllabus: 3.2.1
#lezione("La pagina di prova", "Verificare il funzionamento")[
In *Stampanti e scanner*, selezionare la stampante e scegliere *Gestisci → Stampa pagina di prova*.

Prima di avviare la prova, controllare che sia accesa, collegata e fornita di carta.

La pagina di prova aiuta a verificare che installazione e comunicazione con il computer funzionino.
]

// Ebook: pagine 43; syllabus: 3.2.1
#lezione("Rimuovere una stampante", "Eliminare un dispositivo non più usato")[
Aprire *Impostazioni → Dispositivi → Stampanti e scanner*.

Selezionare la stampante da eliminare e scegliere il comando *Rimuovi*.

In questo modo la stampante viene rimossa dall’elenco dei dispositivi configurati nel computer.
]

// Ebook: pagine 43; syllabus: 3.2.3
#lezione("Stampare un documento", "Scegliere stampante, pagine e copie")[
1. Aprire il documento nell’applicazione di elaborazione testi.
2. Scegliere *File → Stampa*.
3. Selezionare la stampante da usare.
4. Indicare le pagine e il numero di copie.
5. Confermare la stampa.

Controllare le opzioni prima di inviare il documento alla stampante.
]

// Ebook: pagine 43, 44; syllabus: 3.2.4
#illustrazione("La coda di stampa", "I documenti in attesa del proprio turno", [
Quando inviamo più documenti, si forma una *coda di stampa*, come una fila al casello.

In *Stampanti e scanner*, selezionare la stampante e scegliere *Apri coda*.

La finestra elenca i documenti e il loro stato. Si può aprire anche dall’icona della stampante nell’area di notifica durante la stampa.
], "p44-01.png")

// Ebook: pagine 44; syllabus: 3.2.4
#lezione("Gestire un processo di stampa", "Sospendere, riprendere, riavviare o annullare")[
Selezionare il documento nella coda, poi aprire il menu *Documento* o fare clic con il tasto destro.

- *Sospendi*: interrompe temporaneamente la stampa.
- *Riprendi*: continua una stampa sospesa.
- *Riavvia*: ricomincia la stampa dall’inizio.
- *Annulla*: elimina l’operazione di stampa dalla coda.
]
