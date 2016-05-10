
# Vim

## Installation
```
sudo apt-get install vim
```
## Konfiguraton 

```
$HOME/.vimrc
```

## Syntax highlight

```
:syntax <on,off> 
```

## SCP, SFTP, RCP, HTTP, DAV

```
vim ftp://sam@remote.server.de/public/index.php

# read example
:Nread ftp://sam@remote.server.de/public/index.php
:Nread remote.server.com sam <password> public/index.php

# write example
:Nwrite ftp://user@server/path/to/filename
:Nwrite <server> <user> <password> path/filename

# SCP example
:Nread scp://user@server/path/directory/

# see for more information
:help netrw-externapp
:help netrw-netrc
```

## Shortcuts

### Navigation

| cmd  | Navigation                                                              |
|:----:|:------------------------------------------------------------------------|
| `O`  | Moves the cursor to the beginning of the line.                          | 
| `$`  | Moves the cursor to the end of the line.                                |
| `^`  | Moves the cursor to the first non-empty character of the line.          |
| `w`  | Move forward one word (next alphanumeric word).                         |
| `W`  | Move forward one word (delimited by a white space).                     |
| `5w` | Move forward five words.                                                |
| `b`  | Move backward one word (previous alphanumeric word).                    |
| `B`  | Move backward one word (delimited by a white space).                    |
| `5b` | Move backward five words.                                               |
| `G`  | Move to the end of the file.                                            |
| `gg` | Move to the beginning of the file.                                      |
| `h`  | Moves the cursor one character to the left.                             |
| `l`  | Moves the cursor one character to the right.                            |
| `k`  | Moves the cursor up one line.                                           |
| `j`  | Moves the cursor down one lin.                                          |

### Navigate around the document

| cmd  | Navigate around the document                                            |
|:----:|:------------------------------------------------------------------------|
| `(`  | Jumps to the previous sentence.                                         |
| `)`  | Jumps to the next sentence.                                             |
| `{`  | Jumps to the previous paragraph.                                        |
| `}`  | Jumps to the next paragraph.                                            |
| `[[` | Jumps to the previous section.                                          |
| `]]` | Jumps to the next section.                                              |
| `[]` | Jump to the end of the previous section.                                |
| `][` | Jump to the end of the next section.                                    |
| `:<number>` | Jump to line.                                                    |


### Insert

| cmd  | Insert text                                                             |
|:----:|:------------------------------------------------------------------------|
| `a`  | Insert text after the cursor.                                           |
| `A`  | Insert text at the end of the line.                                     |
| `i`  | Insert text before the cursor.                                          |
| `o`  | Begin a new line below the cursor.                                      |
| `O`  | Begin a new line above the cursor.                                      |

| cmd              | Insert                                                      |
|:----------------:|:------------------------------------------------------------|
| `:r [filename]`  | Insert the file [filename] below the cursor.                |
| `:r ![command]`  | Execute [command] and insert its output below the cursor.   |


### Delete

| cmd    | Delete text                                                           |
|:------:|:----------------------------------------------------------------------|
| `x`    | Delete character at cursor.                                           |
| `dw`   | Delete a word.                                                        |
| `d0`   | Delete to the beginning of a line.                                    |
| `d$`   | Delete to the end of a line.                                          |
| `d)`   | Delete to the end of sentence.                                        |
| `dgg`  | Delete to the beginning of the file.                                  |
| `dG`   | Delete to the end of the file.                                        |
| `dd`   | Delete line.                                                          |
| `3dd`  | Delete three lines.                                                   |
| `:d<space>`          | Delete single sign.                                     |
| `:d/<search string>` | Delete all signs until search string.                   |
| `<number>dd`         | Delete special number of rows.                          |


### Copy/Paste

| cmd      | Copy/Paste text                                                     |
|:--------:|:--------------------------------------------------------------------|
| `yy`	   | Copy current line into storage buffer.                              |
| `["x]yy` | Copy the current lines into register x.                             |
| `yy`     | Yank current line.                                                  |
| `y$`     | Yank to end of current line from cursor.                            |
| `yw`     | Yank from cursor to end of current word.                            |
| `5yy`    | yank, for example, 5 lines.                                         |
| `p`	   | Paste storage buffer after current line.                            |
| `P`	   | Paste storage buffer before current line.                           |
| `["x]p`  | Paste from register x after current line.                           |
| `["x]P`  | Paste from register x before current line.                          |
| `<number>yy` | Copy a special number of rows.                                  |


### Search/Replace
| cmd            | Search and replace                                                  |
|:--------------:|:--------------------------------------------------------------------|
| `/<text>` | Search document for `<text>` going forward.                              |
| `?<text>` | Search document for `<text>` going backward.                             |
| `n`       | Move to the next instance of the result from the search.                 |
| `N`       | Move to the previous instance of the result.                             |
| `*`       | Search for word under cursor.                                            |
| `:%s/original/replacement`    | Search for the first occurrence of the string `original` and replace it with `replacement`. |
| `:%s/original/replacement/g`  | Search and replace all occurrences of the string `original` with `replacement`. |
| `:%s/original/replacement/gc` | Search for all occurrences of the string `original` but ask for confirmation before replacing them with `replacement`. |


### Bookmarks

| cmd           | Booksmark                                                      |
|:-------------:|:---------------------------------------------------------------|
| `m {a-z A-Z}` | Set bookmark {a-z A-Z} at the current cursor position.         |
| `:marks`      | List all bookmarks.                                            |
| `{a-z A-Z}`	| Jumps to the bookmark {a-z A-Z}.                               |

### Basic commands

| cmd | Basic commands                                                           |
|:---:|:-------------------------------------------------------------------------|
| `a` | Append text following current cursor position.                           |
| `A` | Append text to the end of current line.                                  |
| `i` | Insert text before the current cursor position.                          |
| `I` | Insert text at the beginning of the cursor line.                         |
| `o` | Open up a new line following the current line and add text there.        |
| `O` | Open up a new line in front of the current line and add text there.      |


### Special commands 

| cmd             | Special commands                                               |
|:---------------:|:---------------------------------------------------------------|
| `:vsplit`       | Vertical split of window.                                      |
| `:split`        | Horizontal split of window.                                    |
| `:e ./`         | Open working dirctory.                                         |
| `:e ~`          | Open home directory.                                           |
| `.`             | Repeat last command(s).                                        |
| `:`             | Input of a complex command.                                    |
| `:e!`           | Reload file.                                                   |
| `u`	          | Undo the last operation.                                       |
| `Ctrl+r`	  | Redo the last undo.                                            |
| `ls`	          | List loaded files in editor.                                   |
| `:n <filename>` | Load file.                                                     |			
| `:n#`           | Edit previous file.                                            |
| `:set nu`       | Enabled line numbers.                                          |
| `:set nonu`     | Disable line numbers.                                          |
| `:!22jsort`     | Sort the current and 22 following lines.                       |
| `cc`            | Delete the current line, set insert-mode.                      |
| `cw`            | Change current word to a new word.                             |
| `q[a-z]`        | Start recording, everything will be recorded including movement actions. |
| `@[a-z]`        | Execute the recorded actions. |


### Save and quit

| cmd         | Save and quit                                                  |
|:-----------:|:---------------------------------------------------------------|
| `:q`        |	Quits Vim but fails when file has been changed.                |
| `:w`        |	Save the file.                                                 |
| `:w <name>` | Save the file with the `name` filename.                        |
| `:wq`       | Save the file and quit Vim.                                    |
| `:q!`       | Quit Vim without saving the changes to the file.               |
| `ZZ`        | Write file, if modified, and quit Vim.                         |
| `ZQ`        | Same as `:q!` Quits Vim without writing changes.               |


### Editor modes

```
a        Append text after the cursor
A        Append text at the end of the line
i        Insert text before the cursor
I        Insert text before the first non-blank in the line
o        Begin a new line BELOW the cursor and insert text
O        Begin a new line ABOVE the cursor and insert text 
s        Erase the current letter under the cursor, set insert-mode
S        Erase the whole line, set insert-mode
cc       Delete the current line, set insert-mode
cw       Delete word, set insert-mode
dd       Delete line under curser
``` 

| cmd   | Editor mode                                                           |
|:-----:|:----------------------------------------------------------------------|
| `i`   |                                                                       |
| `I`   |                                                                       |
| `o`   |                                                                       |
| `O`   |                                                                       |
| `a`   |                                                                       |
| `A`   |                                                                       |
| `v`   | Enter visual mode per character. |
| `V`   | Enter visual mode per line. |
| `ESC` | Exit mode. |


## References

1. https://www.maketecheasier.com/vim-keyboard-shortcuts-cheatsheet/

