
# Makefile


## Installation Make

Das Paket `make` mit dem folgenden Befehl: `sudo apt-get install make`; installieren. Beispiel für einen typischen Aufbau einer Makefile:

### Beispiel Makefile
```
APP   = PROGRAM

SOURCES = $(wildcard *.c) $(wildcard **/*.c)
OBJECTS := $(patsubst %.c, %.o, $(SOURCES))

CC     = gcc
LIBS   =
CFLAGS = -Wall -O2 -g -pedantic -ansi

BINDIR = $(DESTDIR)/usr/bin

.PHONY: all clean distclean

all: $(OBJECTS)
        $(CC) -o $(APP) $(SOURCES) $(LIBS)

install:
        install --mode=755 $(APP) $(BINDIR)/

uninstall:
        $(RM) $(BINDIR)/$(APP)

clean:
        $(RM)  $(OBJECTS)

distclean: clean
        $(RM) $(APP)

%.o: %.c
        $(CC) -c $(CFLAGS) $<
```
Diese Makefile muss im Entwicklungsverzeichnis liegen. Nach der Erstellung der Makefile kann diese mit den folgenden Befehlen:
```
make
make install
make clean
make uninstall
make distclean
```
aufgerufen werden.


## Variablen in Makefiles

| Variablen | Beschreibung      |
|:---------:|:------------------|
| `CC`      | Der Compiler      |
| `CFLAGS`  | Compiler-Optionen |
| `LDFLAGS` | Linker-Optionen   |

| Vordef. Variablen | Beschreibung                                                                       |
|:-----------------:|:-----------------------------------------------------------------------------------|
| `$<`              | Die erste Abhängigkeit                                                             |
| `$@`              | Name des Targets                                                                   |
| `$+`              | Liste aller Abhängigkeiten                                                         |
| `$^`              | Liste aller Abhängigkeiten (Doppelt vorkommende Abhängigkeiten werden eliminiert)  |
| `$?`              |                                                                                    |
| `$*`              |                                                                                    |
| `$$`              |                                                                                    |


| Makros            | Beschreibung                                                                                                       |
|:-----------------:|:-------------------------------------------------------------------------------------------------------------------|
| `=`               | Normale Zuweisung (Rekursiv erweitert)                                                                             |
| `:=`              | Makrodefinition erweitern. `DRIVERS=driverA.c; DRIVERS:=driverB.c; echo $(DRIVERS)`                                |
| `?=`              | Bedingte Makrodefinition. Enthält die Makrodefinition bereits einen Wert, wird die Zuweisung nicht vorgenommmen.   |
| `+=`              | Weitere Text zur Makrodefinition hinzufügen (Einfache Erweiterung; Bevor die Definition erfolgt;).                 |

Beispiel:
```
var := value
var += more
```
ist exakt das Gleiche wie:
```
variable := value
variable := $(variable) more
```

## Schlüsselwörter

| Keywords          | Beschreibung                                                                                                       |
|:-----------------:|:-------------------------------------------------------------------------------------------------------------------|
| `patsubst`        |                                                                                                                    |
| `wildcard`        |                                                                                                                    |
| `notdir`          | $(notdir $SOURCES)                                                                                                 |
| `basename`        |                                                                                                                    |
| `dir`             |                                                                                                                    |

## Besonderheiten
 
* Beim Aufruf von `make` ohne Target wird immer das erste definierte Target in der Makefile aufgerufen,
* Weiterhin wird jede Zeile einer Makefile als separate Shell-Instanz gestartet,
* `make -j4` Kompilierung mit vier Threads starten,
* Setzen Sie vor eine Befehlszeile immer einen Tabulator - keine Leerzeichen!,
* Kommentare werden mit `#` eingeleitet,
* `info make` Zusätzliche Informationen anzeigen,
* Build-in Makros können mit dem Befehl `make -p -f /dev/null` aufgelistet werden,

## References

1. http://stackoverflow.com/questions/4036191/sources-from-subdirectories-in-makefile

