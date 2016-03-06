# Suchverfahren

## Fibonacci-Suche
Das Suchverfahren kann auf sortierte Arrays angewendet werden. Es ist der Binären Suche ähnlich, aber im Gegensatz zu dieser wird das Array über die Fibonacci-Zahlen in zwei Segmente eingeteilt. Die Größe der Segmente ist von den Fibanacci-Zahlen $F_{i-2}$ und $F_{i-1}$ abhängig.

### Fibonacci Zahlen

$F_{0}=0$,

$F_{1}=1$,

$F_{2}=1$,

$F_{n}=F_{i-2}+F_{i-1}$ (für $n > 2$ oder $n >= 2$)


### Fibonacci - Tabelle

|  i |  0 |  1 |  2 |  3 |  4 |  5 |  6 |  7 |  8 |  9 | 10 | 11 | 12 |
|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
| Fi |  0 |  1 |  1 |  2 |  3 |  5 |  8 | 13 | 21 | 34 | 55 | 89 | 89 |


### Eigenschaften
 * Teilung des Array wird über Fibonacci-Zahlen vorgenommen,
 * Array wird in zwei Bereiche mit unterschiedliche Größe geteilt,
 * Rekursiver Algorithmus (Es wird rekursiv mit dem Algorithmus fortgefahren),
 * Komplexität identisch mit Binärer-Suche (Best Case: $O(1)$, Worst Case $log_{2}(n)$,
 * Fibonacci-Zahlen werden meistens vorab berechnet und einem statischen Array gespeichert, 
 * Für ein Array mit 100.000.??? Elementen werden nur die ersten 50 Fibonacci-Zahlen benötigt,
 * Algorithmus basiert auf reiner Substraktion und Addition (Binäre Suche - Division),
 * Sprünge zwischen den Array-Positionen sind im durchschnitt geringer als bei der Binären-Suche,
 * "Divide and Conquer" - Algorithmus
 * Voraussetzung: Array muss bereits sortiert sein!


### Mathematische Beschreibung

#### Array $a$ (sortiert) 

|    i |  0 |  1 |  2 |  3 |  4 |  5 |  6 |  7 |  8 |  9 | 10 | 11 | 12 | 13 |
|------|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
| a[i] | 10 | 22 | 35 | 40 | 45 | 50 | 80 | 82 | 85 | 90 | 95 | 97 | 98 |  - |  


$F_{i-1}$ muss größer oder gleich der Array-Länge $N$ sein.


> Rechtes Segment: $i = i + F_{i-2}$

> Linkes Segment: $i = i - F_{i-1}$

#### Beispiel $x=45$

##### Gegegeben

|    i |  0 |  1 |  2 |  3 |  4 |  5 |  6 |  7 |  8 |  9 | 10 | 11 | 12 | 13 |
|:----:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
| a[i] | 10 | 22 | 35 | 40 | 45 | 50 | 80 | 82 | 85 | 90 | 95 | 97 | 98 |  - |


##### Gesucht

$x=45$

##### Berechnung	



# Markdown 

## Table 

: Sample grid table.

+---------------+---------------+--------------------+
| Fruit         | Price         | Advantages         |
+===============+===============+====================+
| Bananas       | $1.34         | - built-in wrapper |
|               |               | - bright color     |
+---------------+---------------+--------------------+
| Oranges       | $2.10         | - cures scurvy     |
|               |               | - tasty            |
+---------------+---------------+--------------------+

| Right | Left | Default | Center |
|------:|:-----|---------|:------:|
|   12  |  12  |    12   |    12  |
|  123  |  123 |   123   |   123  |
|    1  |    1 |     1   |     1  |

  : Demonstration of pipe table syntax.

| Option | Description |
| ------:| -----------:|
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |
