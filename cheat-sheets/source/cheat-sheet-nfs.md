
# NFS - Network File System

Anleitung zum Einrichten eines **NFS-Servers** und **NFS-Client**. Durch **NFS** kann ein __Client auf eine entfernte Freigabe des NFS-Servers schreibend und lesend zugreifen__, als ob es die lokale Festplatte ist.

## Vorbedingungen

* NFS-Client: `notebook.fritz.box` (IP-Adresse: `192.168.178.21`)
* NFS-Server: `server.fritz.box`, (IP-Adresse: `192.168.178.48`)

## Server

### Installation 

Es müssen die folgenden Pakete auf dem Server installiert werden.
```
sudo apt-get install nfs-kernel-server nfs-common portmap
```

### Verzeichnisse freigegeben 

Für den Zugriff auf die Verzeichnisse des NSF-Servers müssen diese zuvor angelegt und bekannt gemacht werden. Die Bekanntmachung bzw. der Export der Verzeichnisse wird über die Datei `/etc/exports` vorgenommen. 
```
sudo mkdir -p /var/nfs
sudo chown nobody:nogroup /var/nfs
```
> Beim Zugriff auf eine NFS Freigabe, wird dies normalerweise als Benutzer `nobody` ausgeführt. Das `/home` Verzeichniss gehört nicht dem Benutzer `nobody`, dies sollte auch nicht verändert werden. Für das Schreiben und Lesen im Verzeichnis `/home` wird dem NFS-Server mitgeteilt, dass der Zugriff per Root gewährleistet werden soll. 

Zusätzlich müssen diese in der Datei `/etc/exports` konfiguriert bzw. exportiert werden.
```
/home           192.168.178.21(rw,sync,no_root_squash)
/var/nfs        192.168.178.21(rw,sync)
```
Die Option `no_root_squash` bewirkt, dass auf das Verzeichnis `/home` als Root zugegriffen werden kann. Nach der Bearbeitung von der Datei `/etc/exports` muss der folgende Befehl:
```
exportfs -a
```
ausgeführt werden, damit die Änderungen übernommen werden. Ein weitere alternative ist der Neustart vom gesamten NFS-Server.
```
sudo /etc/init.d/nfs-kernel-server restart 
```
Die exportierten Freigaben können per `showmount` von einem Client abgefragt werden:
```
showmount -e <nfs-server> 
showmount -e 192.168.178.48 

``` 

### Hinweise

* Zwischen Freigabe und der Parameterklammer darf kein Leerzeichen stehen: z.B. `192.168.178.21(rw,sync)`,
* `insecure` sollte nur verwendet werden, wenn es unbedingt notwendig ist. Ein aktueller Apple Computer kann sich nur dann mit dem NFS-Server verbinden, wenn die Option insecure gesetzt ist. 

## Client

### Installation 

Für den Zugriff auf dem Server per NFS muss das folgende Paket installiert werden:
```
sudo apt-get install nfs-common portmap
```

### Einhängen von NFS-Freigaben

Für das Einhängen der NFS-Freigaben müssen die Verzeichnisse als erstes erstellt werden.
```
sudo mkdir -p /mnt/nfs/home
sudo mkdir -p /mnt/nfs/var/nfs
```
Das Einhängen der der Verzeichnisse vom NFS-Server wird mit den folgenden Befehlen:
```
sudo mount 192.168.178.48:/home /mnt/nfs/home
sudo mount 192.168.178.48:/var/nfs /mnt/nfs/var/nfs
```
vorgenommen. Danach sollten die NFS Freigaben in der Ausgabe von:
```
df -h
```
zusehen sein. 

### Testen

Zum Testen können auf dem Client die beiden folgenden Dateien:
```
touch /mnt/nfs/home/test.txt
touch /mnt/nfs/var/nfs/test.txt
```
in den entsprechenden Verzeichnissen angelegt werden. Bei erfolgreicher Einrichtung vom NFS-Server und NFS-Client sollten diese Dateien ebenfalls auf der Serverseite zusehen sein.

> Bitte beachte die Eigentümerschaft der Testdateien: Auf die `/home` NFS Freigabe wird als Root zugegriffen, daher gehört `/home/test.txt` dem Benutzer Root; auf die `/var/nfs` Freigabe wird als `nobody` zugegriffen, daher gehört `/var/nfs/test.txt` dem Benutzer `nobody`.

### NFS Freigaben beim Hochfahren einhängen

Für das automatische Einhängen der NFS Freigaben auf dem Client muss die Datei `/etc/fstab` bearbeitet werden. Es müssen in dieser Datei die folgenden Zeilen:
```
192.168.178.48:/home     /mnt/nfs/home      nfs      rw,sync,hard,intr  0     0
192.168.178.48:/var/nfs  /mnt/nfs/var/nfs   nfs      rw,sync,hard,intr  0     0
```
eingetragen werden. An Stelle von `rw`,`sync`,`hard`,`intr` können auch andere Einhängepunkte verwendet werden. Weitere Informationen zu den Optionen können über den Befehl `man nfs` in Erfahrung gebracht werden. Die Einstellungen können mit einem Neustart `sudo reboot` getestet werden.  Nach dem Neustart müssten die NFS-Freigaben in der Ausgabe von:
```
df -h
# or
mount
```
zu sehen sein. 


## Skripte

### NFS Server

Shellskript für die Konfiguration NFS-Server:
```
#!/bin/bash
sudo apt-get install -y nfs-kernel-server nfs-common portmap
sudo mkdir -p /var/nfs
sudo chown nobody:nogroup /var/nfs
echo '
/home           192.168.178.21(rw,sync,no_root_squash)
/var/nfs        192.168.178.21(rw,sync)
' >> /etc/exports
```

### NFS Client

Shellskript für die Konfiguration NFS-Client:
```
#!/bin/bash
sudo apt-get install -y nfs-common portmap
sudo mkdir -p /mnt/nfs/home
sudo mkdir -p /mnt/nfs/var/nfs
sudo mount 192.168.178.48:/home /mnt/nfs/home
sudo mount 192.168.178.48:/var/nfs /mnt/nfs/var/nfs
```

## Referenzen

1. https://wiki.ubuntuusers.de/NFS/
2. https://bbs.archlinux.org/viewtopic.php?id=40918

