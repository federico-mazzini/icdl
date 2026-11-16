# ICDL – Materiali e presentazioni

[**Apri le slide: 1. Computer e dispositivi**](https://federico-mazzini.github.io/icdl/1_computer_dispositivi.pdf) · [**Apri le originali mie**](https://federico-mazzini.github.io/icdl/originali%20mie.pdf) · [**Tutti i PDF**](https://federico-mazzini.github.io/icdl/)

I link aprono l’ultima versione pubblicata per la classe.

## Presentazioni Typst

Sono disponibili due versioni, ciascuna con un unico sorgente Typst:

| Versione | Sorgente | PDF | Contenuto |
| --- | --- | --- | --- |
| Originali mie | `originali mie.typ` | `dist/originali mie.pdf` | Tutte le 49 slide della prima conversione |
| 1. Computer e dispositivi | `1_computer_dispositivi.typ` | `dist/1_computer_dispositivi.pdf` | 47 slide: 26 riprese dalle originali e 21 nuove |

La presentazione iniziale, prima chiamata `presentazione`, è stata rinominata **originali mie**. Il PDF è stato rinominato senza modificarne il contenuto. Raccoglie i tre materiali originali in questo ordine:

1. `mie_slide/Intro al computer.pdf`: 10 slide.
2. `mie_slide/Hardware.pdf`: 29 slide.
3. `mie_slide/Software.pdf`: 10 slide.

Il modello di riferimento è [styles/slides.typ di dispense-comunicazione](https://github.com/federico-mazzini/dispense-comunicazione/blob/main/styles/slides.typ): formato 16:9 da 960 × 540 punti, carattere Libertinus Serif, rosso `#c00000`, fregio e numerazione progressiva. Il modello è adattato e incorporato nel sorgente, senza importazioni da altri repository o pacchetti esterni.

La disposizione dei contenuti segue le slide originali: posizioni delle immagini, ritagli, colonne, interruzioni di riga, schemi e annotazioni inclinate. I testi sono elementi Typst modificabili. Le risorse in `assets/slide/` sono livelli grafici SVG estratti dai PDF, con immagini e forme originali, privi dei testi ricostruiti nel sorgente. Le slide non sono screenshot. I testi già incorporati nelle immagini originali rimangono nelle immagini.

Sono mantenuti anche i crediti originali e i contenuti ripetuti. La numerazione dei tre PDF è sostituita da un unico contatore da 1 a 49. La tipografia e i colori dei titoli seguono il modello Typst, quindi differiscono da quelli dei PDF originali. I PDF in `mie_slide/` restano invariati.

### Compilazione

Dalla cartella principale del repository, con Typst installato:

```sh
mkdir -p dist
bash scripts/build.sh
```

Per ricompilare automaticamente durante le modifiche:

```sh
typst watch 1_computer_dispositivi.typ dist/1_computer_dispositivi.pdf
```

Compilato con Typst 0.15.1. Verificate tutte le 49 pagine, la presenza integrale delle 582 righe di testo estratte dagli originali, l'assenza di testo fuori pagina e il collegamento al video nella slide sulla composizione della CPU. Il carattere Libertinus Serif è incorporato nel PDF.

### Pubblicazione con GitHub Actions

Per ricompilare tutti i sorgenti `.typ` nella cartella principale e aggiornare i PDF su GitHub Pages, inserire `[pdf]` nel messaggio dell’ultimo commit del push su `main`:

```sh
git add .
git commit -m "[pdf] Aggiorna le slide ICDL"
git push origin main
```

I push senza `[pdf]` nell’ultimo commit saltano compilazione e pubblicazione. È possibile avviare la procedura anche da **Actions → Compila e pubblica PDF → Run workflow**.

La build usa Typst 0.15.1 e pubblica i PDF con nomi stabili, senza cambiare i link a ogni aggiornamento. Compila automaticamente anche eventuali nuovi sorgenti `.typ` aggiunti nella cartella principale. La pagina iniziale elenca tutti i PDF generati. Se una compilazione fallisce, la versione già online rimane disponibile. I PDF sono scaricabili anche dall’artifact `icdl-pdf`, conservato per 30 giorni.

`dist/` contiene gli output locali ed è esclusa da Git: la pubblicazione viene generata dai sorgenti. Il sito è configurato con **Settings → Pages → Source: GitHub Actions**.

### 1. Computer e dispositivi

La seconda versione segue esclusivamente la sezione 1 del file locale `syllabus.pdf` (pagine 3–4). Mantiene il formato, il carattere, i colori e le risorse grafiche della conversione originale. I testi aggiunti seguono lo stile delle slide del docente: definizioni dirette, esempi quotidiani e spiegazioni del rapporto tra componenti e funzioni.

Le 21 nuove slide comprendono due copertine, 18 slide di spiegazione e una prova pratica finale. Le integrazioni riguardano ICT e suoi utilizzi; lettori multimediali e fotocamere; impatto di CPU, RAM e memoria di massa sulle prestazioni; periferiche integrate ed esterne, trackpad, webcam e docking station; USB e HDMI; esempi di sistemi operativi e applicazioni; software locale e online; EULA e tipi di licenza; accensione, accesso sicuro, blocco, disconnessione, spegnimento e riavvio.

Sono escluse le tre slide dell’attività sui pancake, gli approfondimenti su sistemi embedded e server, l’architettura di Von Neumann, transistor, cache e ROM, il dettaglio su case, scheda madre e componenti aggiuntivi, il file system e le slide duplicate o di raccordo non necessarie. Questi contenuti restano nella versione **originali mie**. Le 26 slide riprese conservano immagini e disposizione. Nella slide 16 è esplicitato il significato di RAM (Random Access Memory); nella 22 è corretta la definizione delle periferiche di input/output, che devono svolgere entrambe le funzioni. La versione originale di 49 slide rimane invariata.

#### Copertura del syllabus

| Riferimento | Argomento | Slide della seconda versione |
| --- | --- | --- |
| 1.1.1 | Definizione di ICT | 2 |
| 1.1.2 | Servizi Internet, tecnologie mobili e produttività | 3 |
| 1.2.1 | Hardware, tipi di computer e dispositivi | 4, 5, 6, 7, 8, 9, 10 |
| 1.2.2 | CPU, RAM, memoria di massa e prestazioni | 11, 12, 13, 14, 15, 16, 17, 18, 19 |
| 1.2.3 | Periferiche integrate ed esterne | 20, 21, 22, 23, 24 |
| 1.2.4 | Porte di input/output, USB e HDMI | 25, 26 |
| 1.3.1 | Software, sistemi operativi e applicazioni; locale e online | 9, 27, 28, 29, 30, 38 |
| 1.3.2 | Sistemi operativi ed esempi | 30, 31, 32, 33 |
| 1.3.3 | Tipi di applicazioni ed esempi | 30, 34, 35, 36, 37 |
| 1.3.4 | EULA e licenza d’uso | 39 |
| 1.3.5 | Proprietario, open source, trial, shareware e freeware | 40, 41 |
| 1.4.1 | Accensione e accesso sicuro | 43, 44, 47 |
| 1.4.2 | Disconnessione, spegnimento e riavvio | 44, 45, 46, 47 |

#### Verifica e riferimenti

Compilata e controllata l’intera sequenza di 47 pagine. Confrontate le 26 slide riprese con la prima versione, tenendo conto delle due correzioni e del nuovo numero di pagina. Verificati i 13 riferimenti della sezione 1 e l’assenza di testo fuori pagina. I riferimenti al syllabus e la provenienza delle slide sono annotati anche nei commenti del sorgente, senza aggiungere etichette alle slide proiettate.

Per le nuove spiegazioni su licenze e procedure di Windows sono state consultate fonti primarie:

- [GNU: categorie di software](https://www.gnu.org/philosophy/categories.html), per software proprietario, freeware e shareware.
- [Open Source Initiative: definizione di open source](https://opensource.org/osd), per i diritti concessi dalla licenza.
- [Microsoft: condizioni di licenza software](https://learn.microsoft.com/en-us/legal/information-protection/software-license-terms), come esempio di contratto con l’utente finale.
- [Microsoft: accesso agli account in Windows](https://support.microsoft.com/en-gb/accounts-billing/security/user-account-access-in-windows), per accesso, blocco e disconnessione.
- [Microsoft: spegnimento del computer](https://support.microsoft.com/en-gb/windows/experience/power-battery/shut-down-sleep-or-hibernate-your-pc), per la procedura dal menu Start.

## Modulo 1: revisione grafica PowerPoint

- **Originale:** `ICDL – Modulo 1.pptx`, 43 slide, conservato senza modifiche.
- **Versione rivista:** `ICDL_Modulo_1_grafica_migliorata.pptx`, 78 slide modificabili.

### Modifiche

Sfondo bianco, palette blu e petrolio, carattere Arial e gerarchia uniforme tra titoli, definizioni ed esempi. Formato 16:9 per distribuire meglio i contenuti in proiezione, margini regolari e numerazione progressiva.

Le slide affollate sono state suddivise mantenendo la sequenza degli argomenti. Sono state separate le etichette sovrapposte dei dispositivi, riorganizzati gli schemi e i richiami sulle schermate, riallineate le immagini e divise le tabelle più dense. I testi principali usano prevalentemente 22,5–27 pt; alcune etichette usano 19,5–21 pt. Le immagini mantengono proporzioni e ritagli originali.

Testi, forme, frecce e tabelle sono oggetti PowerPoint modificabili. Le immagini restano elementi separati: nessuna slide è stata appiattita in un’immagine.

### Conservazione e verifica

Confronto dei 403 oggetti di testo didattico e di tutte le celle delle tre tabelle originali: nessun contenuto mancante. Conservati tutti i file immagine originali e tutte le 81 occorrenze; una schermata viene ripetuta per separare i richiami. Le tre tabelle originali sono distribuite in cinque tabelle native.

Esportate in PNG e controllate tutte le 43 slide originali e tutte le slide riviste. Il file finale è stato inoltre reimportato ed esportato nuovamente in 78 immagini per verificare il risultato del `.pptx`. Controlli di struttura, margini, adattamento dei testi e tabelle completati senza anomalie residue rilevate. La verifica non comprende l’apertura in Microsoft PowerPoint.

### Criticità conservate

Alcune immagini originali, in particolare porte, icone e schermate, hanno una risoluzione limitata: sono state conservate senza sostituzioni. Formulazioni, refusi, dati tecnici e riferimenti a software e tecnologie datate rimangono invariati, come richiesto; la revisione dei contenuti è rinviata alla fase successiva.

SHA-256 dell’originale, verificato prima e dopo il lavoro:
`8a4251de32916b45ae5268ff36f1aa0b99abe32eb415b7ad15e5a4103752b683`.
