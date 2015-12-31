# sh - Shell scripts 

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
