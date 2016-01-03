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
ls -la > gemeinsam.txt 2>\&1 
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
