# Versionsverwaltung GIT
Wenn man wissen will welche Änderungen, von wem, in welcher Version, in einem bestimmten File vorgenommen wurden, kann man dafür `git blame` verwenden. 
```
git blame <filename>
```
Um Informationen zu einer bestimmten Version zu erhalten kann `git show` folgendermaßen verwendet werden. Dieser Befehl zeigt folgende Informationen zu dem ausgewählten Commit an:
```
    Commit Datum
    Autor
    Parent
    Diff aller geänderten Dateien
```
Wenn nur ein bestimmtes File betrachtet werden soll: 
```
git show <Hash>
git show <Hash>:<filename>
```
[Thomas-Krenn]: https://www.thomas-krenn.com/de/wiki/Git\_Grundbefehle

## Konfiguration von User- und E-Mail-Informationen}
```
git config --global user.name "Test User"
git config --global user.email "tktest@example.com"
git config --global core.editor "vim"
git config --global -l
```
## .gitignore
Eine weitere nützliche Konfiguration, bevor ein Repo in einem Verzeichnis erstellt wird, ist das Ignorieren von Dateien. Jene Dateien, die nicht versioniert werden sollen, kommen in die Datei `.gitignore`. Diese Einstellung macht z.B. Sinn für Verzeichnisse, die kompilierte Binaries enthalten (z.B. Verzeichnis "bin"):
```
echo bin >> .gitignore
```
## REPOS ERSTELLEN
Clonen eines bestehenden Repos
```
git clone ssh://user@domain.com/repo.git
```
Neues, lokales Repo erstellen
```
git init
```
## LOKALE ÄNDERUNGEN
Veränderte Files in der Working Copy http://www.git-tower.com/blog/git-cheat-sheet-de
```
git status
```

## Create

### From existing file
```
git init
git add .
git commit 
```
### From remote repository

## Browse
```
git status
git diff <hash-ref-1> <hash-ref-2>
git log
git blame <file>
git tag -l
```

List remote references:
```
git ls-remote
```

View just remote-tracking branches:
```
git branch --remotes
git branch -r
```

View both strictly local as well as remote-tracking branches:
```
git branch --all
git branch -a
```

## Tag

Listing the available tags in Git:
```
git tag -l
```

Transfer all of your tags to the remote server:
```
git push origin --tags
```

Transfer one tag to remote server:
```
git push origin <tagname>
```

Creating an annotated tag in Git:
```
git tag -a v2.0 -m 'rc-v2.0'
```

Show commit information of tag:
```
git show v0.1
```

Delete remote tag:
```
git push origin :refs/tags/<tagname>
git push origin :<tagname>
git push origin --delete <tagname>
git push origin :v0.1
```

Delete local tag:
```
git tag -d <tagname>
git tag -d v0.1
```

Remove all remote tags:
```
git tag -l | xargs -n 1 git push --delete origin
```

Cleanup the local tags:
```
git tag -l | xargs git tag -d
```

Delete all local tags and get the list of remote tags:
```
git tag -l | xargs git tag -d
git fetch
```

Create a new branch at a specific tag:
```
git checkout -b <branch> <tag>
```

If you forgot to tag the project at v1.3. Tag it later:
```
git log --pretty=oneline
git tag -a v1.3 964f16d
```

## Branches

Lists all local branches in the current repository:
```
git branch
```

Switches to the specified branch and updates the working directory:
```
git checkout <branch>
```

Get all remote branches:
```
git pull --all
```

List remote references.
```
git ls-remote
```

List only remote branches:
```
git branch -r
```

Create a new branch:
```
git checkout -b <branch>
```

Deleting a remote branch:
```
git push origin --delete <branch>  # Git version 1.7.0 or newer
git push origin :<branch>          # Git versions older than 1.7.0
```

Deleting a local branch:
```
git branch -D <branch>
git branch --delete <branch>
git branch -d <branch> # Shorter version
git branch -D <branch> # Force delete un-merged branches
```

Deleting a local remote-tracking branch:
```
git branch --delete --remotes <remote>/<branch>
git branch -dr <remote>/<branch> # Shorter

git fetch <remote> --prune # Delete multiple obsolete tracking branches
git fetch <remote> -p      # Shorter
```

Shows content differences between two branche:
```
git diff <branch-1>...<branch-2>
```

Reset local branch to remote branch:
```
git reset --hard origin/<remote-branch>
```

## Commits

Rewrite last commit message:
```
git commit --amend
```


## Stash

Temporarily stores all modified tracked files:
```
git stash
```

Restores the most recently stashed files:
```
git stash pop
```

Lists all stashed changesets:
```
git stash list
```

Discards the most recently stashed changeset:
```
git stash drop
```


## Reset

Discard local changes in specific file:
```
git checkout HEAD <file>
```

Reset file or directory:
```
git reset <file|directory>
```

Reset your HEAD pointer to a previous commit (Discard all changes!):
```
git reset --hard <commit>
```

To **undo** local file changes but **NOT REMOVE** your last commit:
```
git reset --hard
```

To **undo** local file changes **AND REMOVE** your last commit:
```
git reset --hard HEAD
git reset --hard HEAD^
git reset --hard HEAD~
```

To **keep** local file changes and **REMOVE ONLY** your last commit:
```
git reset --soft HEAD^
git reset --soft HEAD~
```


## Miscellaneous

Changes the file name and prepares it for commit:
```
git mv <file-old> <file-new>
```

Deletes the file from the working directory and stages the deletion:
```
git rm <file>
```

Removes the file from version control but preserves the file locally:
```
git rm --cached <file>
```

Add file or directory:
```
git add <file>
```

Add all current changes to the next commit:
```
git add .
```

Lists all ignored files in this project:
```
git ls-files --other --ignored --exclude-standard
```

Set remote url:
```
git remote set-url origin <remote-url>
```

## References
1. http://stackoverflow.com/questions/4965639/rollback-to-last-git-commit
2. http://stackoverflow.com/questions/2003505/delete-a-git-branch-both-locally-and-remotely
3. https://git-scm.com/book/de/v1/Git-Grundlagen-Tags
4. http://stackoverflow.com/questions/5480258/how-to-delete-a-remote-tag
5. http://github.com
6. https://training.github.com/kit/downloads/github-git-cheat-sheet.pdf
