# Istruzioni per l’agente

## Lavoro nel repository

- Mantieni `README.md` con i soli link alle presentazioni pubblicate e all’indice dei PDF. Inserisci qui le istruzioni operative e le note tecniche.
- Ogni presentazione ha un unico sorgente `.typ` nella cartella principale. Le risorse grafiche sono in `assets/slide/`.
- Conserva `originali mie.typ` come versione integrale delle slide del docente; modificala solo su richiesta esplicita. Non alterare i PDF di origine in `mie_slide/`.
- Per `1_computer_dispositivi.typ`, segui soltanto la sezione 1 del file locale `syllabus.pdf`, mantenendo la copertura dei 13 riferimenti riportati sotto.
- Mantieni formato 960 × 540 punti, Libertinus Serif, titoli rossi `#c00000`, impaginazione, immagini e stile narrativo del docente. I testi devono restare modificabili in Typst.
- Quando modifichi le slide, compila con Typst 0.15.1 tramite `bash scripts/build.sh`, controlla visivamente le pagine modificate e verifica conteggio, numerazione, testi e assenza di sovrapposizioni o contenuti fuori pagina.
- Non versionare `dist/`: contiene PDF e indice generati. La build compila tutti i sorgenti `.typ` della cartella principale.
- Mantieni stabili i nomi dei PDF e i link pubblici. Se aggiungi una presentazione, aggiorna i link nel README e, se serve, il titolo in `scripts/build_index.py`.
- Per pubblicare i PDF, usa `[pdf]` nel messaggio dell’ultimo commit del push su `main`. Per modifiche alle sole istruzioni o alla documentazione non è necessaria una nuova pubblicazione dei PDF.
- Dopo un push che pubblica PDF, verifica l’esito dell’Action e l’accessibilità dei file su GitHub Pages.

## Contesto e riferimenti del progetto

## Presentazioni Typst

Sono disponibili quattro presentazioni, ciascuna con un unico sorgente Typst:

| Versione | Sorgente | PDF | Contenuto |
| --- | --- | --- | --- |
| Originali mie | `originali mie.typ` | `dist/originali mie.pdf` | Tutte le 49 slide della prima conversione |
| 1. Computer e dispositivi | `1_computer_dispositivi.typ` | `dist/1_computer_dispositivi.pdf` | 47 slide: 26 riprese dalle originali e 21 nuove |
| 2. Desktop, icone e impostazioni | `2_desktop_icone_impostazioni.typ` | `dist/2_desktop_icone_impostazioni.pdf` | 8 slide, selezione concordata dei punti della sezione 2 |
| 4. Gestione di file | `4_gestione_file.typ` | `dist/4_gestione_file.pdf` | 23 slide, selezione ridotta concordata della sezione 4 |

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

### 2. Desktop, icone e impostazioni

Segui la selezione del docente, senza aggiungere automaticamente gli argomenti esclusi. La presentazione non intende coprire integralmente la sezione 2.

| Slide | Riferimento | Trattamento |
| --- | --- | --- |
| 1 | — | Copertina nello stile della prima presentazione |
| 2 | 2.1.1, 2.1.2 | Barra di Windows 10 con frecce; identificare solo le icone presenti nello screenshot |
| 3 | 2.2.2 | Breve spiegazione di multitasking e finestre con screenshot, dimostrazione dal vivo |
| 4 | 2.3.2 | Breve spiegazione delle informazioni del computer con screenshot, dimostrazione dal vivo |
| 5 | 2.3.5 | Applicazione bloccata e Gestione attività, con screenshot |
| 6 | 2.3.6 | Installare e disinstallare: accenno per dimostrazione dal vivo |
| 7 | 2.3.7 | Screenshot di Espelli dispositivo e due righe di spiegazione |
| 8 | 2.3.8 | Screenshot di Cattura e annota e scorciatoia Windows + Shift + S |

Saltare 2.1.3, 2.1.4, 2.2.1, 2.2.3, 2.3.1, 2.3.3 e 2.3.4. Tutti gli screenshot devono essere di Windows 10, senza acquisizioni dal Mac del docente. Sono ammesse immagini da tutorial esterni, anche Aranzulla, verificando che non siano state sostituite con schermate di Windows 11. Le immagini usate, i rispettivi autori e i ritagli sono documentati in `assets/windows10/fonti.json`; i ritagli SVG mantengono intatti i file bitmap originali. Non generare schermate simulate.

Riferimenti per le procedure: [Microsoft, barra delle applicazioni](https://support.microsoft.com/it-it/windows/experience/personalization/customize-the-taskbar-in-windows), [Microsoft, Cattura e annota in Windows 10](https://blogs.windows.com/windowsexperience/2019/04/08/windows-10-tip-snip-sketch/), [Microsoft, rimozione sicura](https://support.microsoft.com/en-us/windows/hardware/safely-remove-hardware-in-windows), [Microsoft, strumenti di supporto e Gestione attività](https://support.microsoft.com/en-us/accessibility/windows/use-a-screen-reader-to-navigate-windows-support-tools).

### 4. Gestione di file

Riprendi il testo e lo stile delle dispense del docente in [intrormatica](https://github.com/federico-mazzini/intrormatica). Usa come fonti principali `src/1-file-cartelle/1-1-file-cartelle.typ`, `1-2-esercizi.typ`, `src/3-bit-byte-dimensioni/3-1-bit-byte-dimensioni.typ` e le parti pertinenti di Hardware e Software. Conserva definizioni, analogie ed esempi scolastici: file come contenitore digitale, struttura ad albero, percorso come indirizzo, cartella Classe 1A, ZIP come copia dei materiali. Adatta il nuovo allo stesso italiano, senza riscrivere inutilmente i testi già pronti.

Gli schemi originali e gli screenshot esterni di Windows 10 sono in `assets/gestione-file/`. La provenienza di ogni slide e la mappatura puntuale al syllabus sono in `assets/gestione-file/fonti.json`. I PDF delle sezioni 1 e 2 restano separati. Mantieni copertina, stile Typst comune, paragrafi brevi e tabelle modificabili. Su richiesta del docente, non includere i laboratori finali né gli approfondimenti su conversione dei formati, indicizzazione, conflitti tra file omonimi, eliminazione fuori dal cestino, limiti degli allegati email o aggiornamento degli ZIP. Conserva le basi su file, nomi ed estensioni necessarie al syllabus.

Selezione aggiornata su indicazione del docente: eliminate le precedenti slide 9, 11, 12, 14, 15, 16 e 19; unite 21–22; screenshot aggiunti alle precedenti 10 e 18; rimosso Blu-ray. La copertura del syllabus è ora parziale. Non reinserire i contenuti esclusi senza richiesta. Numerazione corrente:

| Slide | Argomento | Riferimenti |
| --- | --- | --- |
| 1 | Gestione di file | — |
| 2 | Che cos’è un file? — Un contenitore digitale | 4.1.4 |
| 3 | Nome ed estensione — Come riconosciamo un file | 4.1.4 |
| 4 | I tipi di file — Le estensioni più comuni | 4.1.4 |
| 5 | Cartelle e sottocartelle — Organizzare i materiali | 4.1.1, 4.1.6 |
| 6 | L’albero delle cartelle — Un esempio con i materiali della classe | 4.1.1 |
| 7 | Il percorso di un file — Un indirizzo per ritrovarlo | 4.1.1 |
| 8 | Esplora file — Il programma con cui ci muoviamo tra i materiali | 4.1.1, 4.1.3 |
| 9 | Le proprietà — Nome, dimensioni e posizione | 4.1.2 |
| 10 | Rinominare — Cambiare il nome, non il contenuto | 4.1.8 |
| 11 | Selezionare file e cartelle — Uno, alcuni oppure tutti | 4.2.1 |
| 12 | Ordinare i materiali — Nome, dimensione, tipo e data | 4.2.2 |
| 13 | Copiare e spostare in Windows — Selezionare, scegliere il comando, indicare dove | 4.2.3 |
| 14 | Il cestino — Eliminare, ripristinare e svuotare | 4.2.4, 4.2.5 |
| 15 | Dove conserviamo i file? — Supporti e unità di archiviazione | 4.3.1 |
| 16 | Le unità di misura — Byte, KB, MB, GB e TB | 4.3.2 |
| 17 | Lo spazio di archiviazione — Capacità totale, spazio occupato e disponibile | 4.3.2, 4.3.3 |
| 18 | Quanto spazio è rimasto? — Questo PC e le proprietà dell’unità | 4.3.3 |
| 19 | I file ZIP — Più materiali in un unico file | 4.3.4 |
| 20 | Creare uno ZIP — Dalla cartella a un unico file | 4.3.5 |
| 21 | Comprimere in Windows 10 — Creare una cartella compressa | 4.3.5 |
| 22 | Estrarre uno ZIP — Ritrovare i file e le cartelle | 4.3.6 |
| 23 | Estrarre in Windows 10 — Scegliere la cartella di destinazione | 4.3.6 |

Per le procedure sono stati consultati i riferimenti Microsoft su [Esplora file](https://support.microsoft.com/en-us/windows/experience/fileexplorer/file-explorer-in-windows), [ZIP](https://support.microsoft.com/en-us/windows/experience/storage-filemanagement/zip-and-unzip-files), [estensioni](https://support.microsoft.com/it-it/windows/experience/storage-filemanagement/common-file-name-extensions-in-windows) e [ricerca e indicizzazione](https://support.microsoft.com/en-us/windows/experience/performance-optimization/search-indexing-in-windows). Non confondere le procedure di Windows 10 con quelle di Windows 11. La ricerca nel contenuto dipende dalle impostazioni e dal tipo di file; il cestino non raccoglie necessariamente le eliminazioni da unità rimovibili o di rete.

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
