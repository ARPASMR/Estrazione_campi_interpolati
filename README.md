# Estrazione_campi_interpolati
_Procedura per estrazione dati da campi OI (Optimal Interpolation)_

Si è reso necessario implementare uno script in grado di estrarre i dati da un punto di griglia interno alla matrice oraria già descritta in questa pagina. Nello specifico caso è servito il vento per un caso di molestie olfattive. Lo script è stato creato da Mauro Mussin e successivamente modificato e corretto da Matteo Zanetti e Antioco Vargiu.
Si tratta quindi di conoscere il punto di griglia più vicino al sito di interesse, e per questo potrebbe essere utile eseguire lo script get_cell.R per individuare la "cella" corretta da estrarre.

Per funzionare, lo script necessita di salvare in una cartella i file ASCII della variabile di interesse (componenti U e V nel caso del vento) disponibili su MEDIANO, per tutti i giorni di interesse:

```
/home/meteo/programmi/interpolazione_statistica/oi_ascii/archivio_ascii/vento
```
Il codice principale (extracting_wind.ipynb), scritto in Python e utilizzabile con Jupyter (anche in Anaconda), produce un file contenente data, ora e valori delle singole componenti del vento (U e V).
A questo punto, al fine di produrre un file con il modulo della velocità (m/s) e la direzione (gradi sessagesimali), è necessario adattare ed eseguire lo script wind_speed_direction.R, con il quale si avrà il file "sistemato" da poter inviare all'utente interessato. Un esempio è caricato in repository (Vento_Concorezzo_202005.xlsx)

_Istruzioni per il calcolo del modulo e la velocità del vento, contenute anche nel file R sopramenzionato_
```
#Calcolo del modulo del vento (m/s) e della direzione (360 gradi)
speed_ms = sqrt(df$U_ms^2 + df$V_ms^2)
dir_degree = (270-(atan2(df$V_ms, df$U_ms)*(180/pi)))%%360
```

## Esempio di Output finale
```
Date	       Hour	   U_ms	           V_ms	          speed_ms	dir_degree
01/06/2019	0	-0.5096769	-0.8466251	0.988202713	31.04836737
01/06/2019	1	-0.5896925	-1.305656	1.432646095	24.30605835
01/06/2019	2	-0.5918008	-1.301805	1.430008547	24.44655382
01/06/2019	3	-0.6053566	-1.328725	1.46012559	24.49363452
01/06/2019	4	-0.3656221	-1.279833	1.331034195	15.94355524
```

## Esempio di disclaimer nell'invio dei dati (avvertenze per l'uso)
```
come da accordi si è proceduto all’estrazione del dato stimato di vento da campo interpolato (passo regolare di 1.5 km) sul punto di griglia più vicino al sito di interesse, in quanto l’anemometro più vicino, sito a Milano Parco Nord (Cinisello Balsamo), dista 10.7 km.

I dati nel file .xls allegato sono suddivisi per mese, dal 1/12/2019 al 30/06/2020. Il dato mancante è indicato con -9999. Nel file si forniscono inoltre le singole componenti U e V, con le quali sono state calcolate successivamente velocità e direzione.
L’ora indicata è solare (UTC + 1), l’unità di misura della velocità è m/s, la direzione di provenienza del vento è espressa in gradi sessagesimali e tutti i dati forniti sono medie orarie. 
Es. Il dato relativo al 02/12/2019 ore 10 è la media oraria tra le ore 09 e le ore 10.

Si precisa inoltre che il dato fornito da campo interpolato rappresenta una stima, la migliore possibile con la tecnica dell’Optimal Interpolation, descritta nel documento pdf anch’esso allegato. In quanto stima, il dato è soggetto ad un margine di incertezza. L’incertezza non è costante, è stato osservato che tende a essere maggiore nel caso di ventilazione debole e poco costante nella direzione. 
```

### Riferimenti:  
Matteo Zanetti  
ma.zanetti@arpalombardia.it  
mzanetti1986@gmail.com
