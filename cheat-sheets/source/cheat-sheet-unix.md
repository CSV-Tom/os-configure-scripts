# UNIX-System

## System utilities

Print system information
```
uname -a
```

Initialize a terminal or query terminfo database
```
tput colors
```

An interface to the on-line reference manuals
```
man <chapter> <command>
```

Display the amount of available disk space for file systems 
```
df
```

Human readable output.
```
df -h 
```

Display amount of free and used memory in the system
```
free 
```

Convert and copy a file
```
dd if=<infile> of=<outfile> bs=<blocksize> count=<count>
dd if=/dev/zero of=/dev/<destination partition>
```

Create a symbolic link to files
```
ln -s <source> [name of link]
```

Device file that discards all data written to it but reports that the write operation succeeded.
```
/dev/null
```

```
/dev/full
/dev/random
/dev/urandom
/dev/zero
```

```
cd -
```

```
pwd
```

```
fdisk
```

```
insmod
modprobe
lsmod
rmod
```

```
mount
umount
```

```
sha1sum
```

```
md5
```


```
strace
```

```
cat /proc/ 
```
