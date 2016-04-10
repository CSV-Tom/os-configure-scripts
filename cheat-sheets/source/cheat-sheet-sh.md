# sh - Shell scripts 

## Standard streams
The three I/O connections are called standard input (stdin), standard output (stdout) and standard error (stderr):

*	stdin  - 0,
*	stdout - 1,
*	stderr - 2,

```
ls -la /home/user > stdout-channel.log
ls -la /home/user 1> stdout-channel.log
```

It can redirect both channels simultaneously in two different files:
```
ls -la > stdout-channel.log 2> stderr-channel.log
```

Furthermore, it is also possible to pass stdout-channel and stderr-channel in a file:
```
ls -la > both-channels.log 2>\&1 
```

## Shebang `#!`
Shebang interpreter directive: `!#interpreter [optional-arg]`.
```
#!/bin/sh    
#!/bin/cat
#!/bin/php
#!/bin/sh -x <path> foo bar
#!/usr/bin/env sh
#!/usr/bin/env python -c
```

## Sub-String
Extract filename and extension
```
filename=$(basename "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"
```

## Absolute path
Absolute path to this script, e.g. `/home/$USER/bin/example.sh`.
```
SCRIPT=$(readlink -f "$0")
```
Absolute path this script is in, thus `/home/$USER/bin`.
```
SCRIPTPATH=$(dirname "$SCRIPT")
```
Working directory:
```
echo $PWD
# or
dir=`pwd`
```

## Loop over set of files
```
#!/bin/bash
FILES=/path/to/*.tex
for f in $FILES
do
  echo "Processing $f file..."
done
```

## Processing Command Line Arguments
```
#!/bin/bash
for f in $*
do
  echo "Processing $f file..."
done
```

## Read file content
Looping through the content of a file. 
```
while read line; do
  echo $line
done < example.in
```
Exceptionally, if the loop body may read from standard input, you can open the file using a different file descriptor
```
while read -u 10 line; do
  ...
done 10 < example.in
```
10 is just an arbitrary number (different from 0, 1, 2).

Another solution is:
```
cat peptides.txt | while read line
do
   echo "${line}"
done
```
## Directories and files
Count directories and files
```
FILECOUNT="$(find . -type f -maxdepth 1 -printf x | wc -c)"
FILECOUNT="$(find . -type f | wc -l)"

DIRCOUNT="$(find . -type d -maxdepth 1 -printf x | wc -c)"
DIRCOUNT="$(find . -type d | wc -l)"
DIRCOUNT="$(find . -mindepth 1 -maxdepth 1 -type d | wc -l)"
```

## Functions 
Returns 0 if the specified string contains the specified substring, otherwise returns 1.
```
containsSubstring() {
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
        return 0    # $substring is in $string
    else
        return 1    # $substring is not in $string
    fi
}

containsSubstring "*backup*" && echo "Found" || "Not found"
```

## Hacks
Redirect output to a location you don't have permission to write?
```
sudo sh -c 'echo "export PATH=$PATH:/opt/tbsw-buidler/bin" > /etc/profile.d/tbsw-builder.sh'
```

## Referenz
1. http://stackoverflow.com/questions/1521462/looping-through-the-content-of-a-file-in-bash
2. http://stackoverflow.com/questions/2829613/how-do-you-tell-if-a-string-contains-another-string-in-unix-shell-scripting
3. http://www.cyberciti.biz/faq/bash-loop-over-file/
