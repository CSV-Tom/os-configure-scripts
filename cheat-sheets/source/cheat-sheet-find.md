# Linux - find
The following commands were collected from several sites. The sources can be found under the headline references. 

## Syntax
Basic syntax of the find command looks like:
```
find <location> <comparison-criteria> <search-term>
```

## Examples

Search for files in multiple directories
```
find /tmp /etc -name '*.php'
```

Limit depth of directory traversal
```
find . -maxdepth 2 -name '*.php'
```

Invert matches 
```
find . -not -name '*.php'
find . ! -name '*.php'
```

Combine multiple search criterias
```
find . -name 'abc*' ! -name '*.php'
```

or operator
```
find -name '*.php' -o -name '*.txt'
```

To count the number of empty files under current directory, pipe the find command to wc -l.
```
find . -type f -empty | wc -l
```

How many non-empty files are located under the current directory.
```
find . -type f -not -empty | wc -l
```

Delete all files with extension *.aux or *.o
```
find -name "*.aux" -delete 
find -name "*.o" -delete
```

Use the following command to remove all empty directories under the current directory
```
find . -type d -empty -exec rmdir {} \;
```

Delete all matching files or directories. The following command will remove all text files.
```
find . -type f -name "*.txt" -exec rm -f {} \;
```

Delete only files whose name is .DS_Store (Attention: Mac OS-Systems!).
```
find . -type f -name .DS_Store -delete
find . -name ".DS_Store" -print0 | xargs -0 rm -rf
```

Use the following command to remove all of those annoying Apple files, but this one also does it recursively through all sub-directories.
```
find . -name "._*" -print0 | xargs -0 rm -rf
find . -iname '._*' -exec rm -rf {} \;
```

Find all directories or files whose name is index.php or os-configure. 
```
find / -type d -name os-configure
find / -type f -name index.php
```

Find files with different extensions
```
find . -type f \( -name "*.c" -o -name "*.sh" \)
find . -type f \( -name "*cache" -o -name "*xml" -o -name "*html" \)
```

Find files by text in the file (find + grep)
```
find . -type f -name "*.java" -exec grep -l StringBuffer {} \;    
```

Find files by text in the file (find + grep) and ignore case with -i option.
```
find . -type f -name "*.java" -exec grep -il string {} \;
```

Find files and grep content, 5 lines before, 10 lines after grep matches
```
find . -type f -name "*.php" -exec grep -B5 -A10 'null' {} \;
```

Case-insensitive searching
```
find . -iname InDeX.pHp
find . -iname foo -type d
find . -iname foo -type f
```

Find all php files in a directory.
```
find . -type f -name "*.php"
```

To recursively give directories read & execute privileges:
```
find /path/to/base/dir -type d -exec chmod 755 {} +
```
To recursively give files read privileges: 
```
find /path/to/base/dir -type f -exec chmod 644 {} +
```
or, if there are many objects to process:
```
chmod 755 $(find /path/to/base/dir -type d)
chmod 644 $(find /path/to/base/dir -type f)
```
or, to reduce chmod spawning
```
find /path/to/base/dir -type d -print0 | xargs -0 chmod 755 
find /path/to/base/dir -type f -print0 | xargs -0 chmod 644
```

Find all the files whose permissions are 777.
```
find . -type f -perm 0777 -print
```

Find all the files without permission 777.
```
find / -type f ! -perm 777
```

Find all the directories without permission 111.
```
find -type d ! -perm 111
```

Find all the SGID bit files whose permissions set to 644.
```
find / -perm 2644
```

Find all the Sticky Bit set files whose permission are 551.
```
find / -perm 1551
```

Find all SUID set files.
```
find / -perm /u=s
```

Find all SGID set files.
```
find / -perm /g+s
```

Find all Read Only files.
```
find / -perm /u=r
```

Find all Executable files.
```
find / -perm /a=x
```

Find all 777 permission files and use chmod command to set permissions to 644.
```
find / -type f -perm 0777 -print -exec chmod 644 {} \;
```

Find all 777 permission directories and use chmod command to set permissions to 755.
```
find / -type d -perm 777 -print -exec chmod 755 {} \;
```

To find a single file called tmux.conf and remove it.
```
find . -type f -name "tmux.conf" -exec rm -f {} \;
```

To find and remove multiple files such as .mp3 or .txt, then use.
```
find . -type f -name "*.txt" -exec rm -f {} \;
find . -type f -name "*.mp3" -exec rm -f {} \;
```

To find all empty files under certain path.
```
find /tmp -type f -empty
```

To find all empty directories under certain path.
```
find /tmp -type d -empty
```

To find all hidden files, use below command.
```
find /tmp -type f -name '.*'
```

To find all or single file called tecmint.txt under / root directory of owner root.
```
find / -user root -name tecmint.txt
```

To find all files that belongs to user Tecmint under /home directory.
```
find /home -user tecmint
```

To find all files that belongs to group Developer under /home directory.
```
find /home -group developer
```

To find all .txt files of user Tecmint under /home directory.
```
find /home -user tecmint -iname "*.txt"
```

To find all the files which are modified 50 days back.
```
find / -mtime 50
```

To find all the files which are accessed 50 days back.
```
find / -atime 50
```

To find all the files which are modified more than 50 days back and less than 100 days.
```
%find / -mtime +50 –mtime -100
```

To find all the files which are changed in last 1 hour.
```
find / -cmin -60
```

To find all the files which are modified in last 1 hour.
```
find / -mmin -60
```

To find all the files which are accessed in last 1 hour.
```
find / -amin -60
```

To find all 50MB files, use.
```
find / -size 50M
```

To find all the files which are greater than 50MB and less than 100MB.
```
find / -size +50M -size -100M
```

To find all 100MB files and delete them using one single command.
```
find / -size +100M -exec rm -rf {} \;
```

Find all .mp3 files with more than 10MB and delete them using one single command.
```
find / -type f -name *.mp3 -size +10M -exec rm {} \;
```

Find largest and smallest files. The find command when used in combination with the ls and sort command can be used to list out the largest files. The following command will display the 5 largest file in the current directory and its subdirectory. 
```
find . -type f -exec ls -s {} \; | sort -n -r | head -5
```

Similary when sorted in ascending order, it would show the smallest files first
```
find . -type f -exec ls -s {} \; | sort -n | head -5
```
## References
1. http://superuser.com/questions/91935/how-to-chmod-all-directories-except-files-recursively/91966
2. http://www.tecmint.com/35-practical-examples-of-linux-find-command/
3. http://www.binarytides.com/linux-find-command-examples/
4. http://alvinalexander.com/unix/edu/examples/find.shtml
5. http://www.thegeekstuff.com/2010/03/find-empty-directories-and-files/
6. http://stackoverflow.com/questions/2016844/bash-recursively-remove-files
