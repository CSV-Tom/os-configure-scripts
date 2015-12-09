# find

## Commands
```
find -type f -print0 | xargs -r0 grep -F 'example'
find -name '*.[ch]' | xargs grep -E 'expr'	
find -type f -print0 | xargs -r0 grep -F 'example'
find -maxdepth 1 -type f | xargs grep -F 'example'
find -type f ! -perm -444
find -type d ! -perm -111
```
