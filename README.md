# Simulazione Elettrofisiologica Cardiaca (Modello di Rogers-McCulloch) 

## Panoramica del Progetto
Questo repository contiene una simulazione computazionale del potenziale d'azione cardiaco. Utilizzando il modello fenomenologico di Rogers-McCulloch, il codice risolve il sistema di equazioni differenziali che governa la dinamica del potenziale transmembrana e il recupero cellulare.

Il focus principale del progetto è l'implementazione di un **protocollo di stimolazione S1-S2**, fondamentale in elettrofisiologia per analizzare la refrattarietà del tessuto cardiaco e la vulnerabilità alle aritmie.

## Competenze Dimostrate
* Modellistica Biomedica: Traduzione di fenomeni fisiologici in modelli matematici continui.
* Calcolo Numerico (MATLAB): Utilizzo di metodi di integrazione per ODE (es. `ode45` con tolleranze custom).
* Analisi dei Segnali: Visualizzazione delle dinamiche temporali del potenziale d'azione e della corrente di stimolo.

## Struttura del Repository
* `simulazione_azione.m`: Script MATLAB principale con la definizione del sistema ODE e i parametri di simulazione.
* `Risultati_Simulazione.pdf`: Esportazione del Live Script contenente i grafici pre-generati (utile per visualizzare i risultati senza avere MATLAB installato).

## Come utilizzare la simulazione
1. Aprire il file `.m` in MATLAB.
2. Eseguire lo script per generare il potenziale d'azione di base.
3. **Testare il Periodo Refrattario:** Alla riga relativa al parametro `t_S2` (istante del secondo stimolo), provare a ridurre il valore da `250 ms` a `150 ms`. Eseguendo nuovamente lo script, si osserverà come la cellula, trovandosi nel suo periodo refrattario assoluto, non genererà un secondo potenziale d'azione.
