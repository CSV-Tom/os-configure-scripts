# Conversion

## Convert `*.wav to *.mp3`
The script converts *.wav-files to *.mp3-files.
```
#!/bin/bash
mkdir temp
for i in *.wav ; do
b=`basename "$i" .wav`
lame -V0 "$i" "./temp/$b.mp3"
done
```
