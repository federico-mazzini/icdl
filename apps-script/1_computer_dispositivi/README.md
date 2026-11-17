# Quiz: Computer e dispositivi

Quattro script autonomi, ciascuno con le proprie 25 domande già incluse. Non servono librerie, file di dati o servizi avanzati.

| Script | Funzione da eseguire | Facili | Medie | Difficili |
| --- | --- | ---: | ---: | ---: |
| [Quiz 1](quiz_1.gs) | `creaQuizComputer1` | 9 | 8 | 8 |
| [Quiz 2](quiz_2.gs) | `creaQuizComputer2` | 8 | 9 | 8 |
| [Quiz 3](quiz_3.gs) | `creaQuizComputer3` | 8 | 8 | 9 |
| [Quiz 4](quiz_4.gs) | `creaQuizComputer4` | 9 | 8 | 8 |

Ogni quiz contiene 20 domande a scelta singola e 5 a risposta multipla, tutte obbligatorie e da un punto, per un totale di 25 punti. Le chiavi di risposta e le spiegazioni del pool sono già impostate come correzione e feedback.

Le domande sono mescolate. Gli identificatori del pool e i livelli di difficoltà rimangono nei dati dello script e non sono inseriti nei testi mostrati agli studenti.

## Come usarli

1. Apri [Google Apps Script](https://script.google.com/) e crea un progetto.
2. Incolla uno script nel file `Codice.gs`. Puoi anche mettere i quattro script in quattro file dello stesso progetto: le funzioni hanno nomi diversi.
3. Seleziona la funzione indicata nella tabella, premi **Esegui** e completa l’autorizzazione richiesta da Google. Ripeti per ciascuno dei quattro script.
4. Apri il link **Modifica** nel registro di esecuzione. Il quiz viene creato in bozza: controllalo, scegli le impostazioni di pubblicazione dei voti e premi **Pubblica** quando vuoi distribuirlo.

Il registro mostra anche il link di compilazione, che diventa utilizzabile dopo la pubblicazione. Nelle impostazioni di Google Forms puoi scegliere se raccogliere le email e quali risultati mostrare agli studenti. Gli script non raccolgono email e non aggiungono domande anagrafiche, per mantenere esattamente 25 quesiti.

## Scelta delle domande

Le domande provengono dal [pool Computer e dispositivi](../../domande/1_computer_dispositivi.md), mantenendo testi, opzioni e soluzioni. Come concordato, ogni quiz contiene 8–9 domande per difficoltà.

Sono usate 84 domande diverse: tutte le 25 medie, tutte le 25 difficili e 34 delle 50 facili. Sedici domande medie o difficili ricompaiono una volta in un altro quiz; non ci sono ripetizioni all’interno dello stesso quiz.

## Nuove esecuzioni

Dopo una creazione riuscita, lo script salva l’ID nelle proprietà del progetto. Rieseguire la stessa funzione nello stesso progetto restituisce i link del modulo esistente, senza ricreare le domande o sovrascrivere modifiche manuali.

Per creare intenzionalmente una nuova copia, cambia il valore di `chiave` nello script, per esempio sostituendo `v1` con `v2`, oppure usa un altro progetto Apps Script. Se elimini il modulo da Drive, cambia la chiave prima di ricrearlo.

Se Google interrompe la creazione, il registro contiene il link alla bozza incompleta. Lo script salva l’ID come completato solo alla fine: una nuova esecuzione dopo un’interruzione può creare un’altra bozza.

## Verifica

Eseguito il controllo sintattico dei quattro file ed eseguiti test locali con simulazione dei servizi Google: conteggi, difficoltà, corrispondenza al pool, chiavi singole e multiple, punteggi, convivenza dei quattro file, nuove esecuzioni e gestione delle interruzioni.

Dalla radice del repository:

```sh
node --test tests/apps_script_quiz.test.cjs
```

La verifica locale non esegue chiamate al tuo account Google: i moduli saranno creati quando lancerai le funzioni in Apps Script.

Riferimenti: [servizio Forms](https://developers.google.com/apps-script/reference/forms), [creazione dei moduli](https://developers.google.com/apps-script/reference/forms/form-app), [caselle di controllo e chiavi](https://developers.google.com/apps-script/reference/forms/checkbox-item), [quiz e pubblicazione dei voti](https://support.google.com/docs/answer/7032287?hl=it).
