# Git 

## Description
Git is a free and open source distributed version control system.


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

## Global options
```
git config --global user.name "Max Mustermann"
git config --global user.email "mustermann@example.com"
git config --global core.editor "vim"
git config --global -l
``` 

## .gitignore
Eine weitere nützliche Konfiguration, bevor ein Repo in einem Verzeichnis erstellt wird, ist das Ignorieren von Dateien. Jene Dateien, die nicht versioniert werden sollen, kommen in die Datei `.gitignore`. Diese Einstellung macht z.B. Sinn für Verzeichnisse, die kompilierte Binaries enthalten (z.B. Verzeichnis "bin"):
```
echo bin >> .gitignore
``` 

## Create

Create an local repository:
```
git init
git add .
git commit 
```

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
```
Clone a repository:
```
git clone ssh://user@domain.com/repo.git
```

 
## Browse

General:
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
Rename git branch locally and remotely:
```
git branch -m old_branch new_branch 
git push origin :old_branch 
git push --set-upstream origin new_branch
```
Rename git tag locally and remotely:
```
git tag <new> <old>
git tag -d <old>
git push origin :refs/tags/<old>
git push --tags
```

## Searching

### Searching for Content
```
git grep <reg-exp>
git grep -e <reg-exp-1> [--or] -e <reg-exp-2>
git grep -e <reg-exp-1> --and -e <reg-exp-2>
git grep -l --all-match -e <reg-exp-1> -e <reg-exp-2>
git grep <reg-exp> $(git rev-list --all)
git grep <reg-exp> $(git rev-list rev1..rev2)
```

### Searching Logs and Commit History
```
git log --grep <reg-exp-1>
git log --grep <reg-exp-1> --grep <reg-exp-2>
git log --grep <reg-exp-1> --and --grep <reg-exp-2>
```

## Cleaning

Remove all untracked files from working copy:
```
git clean -f
```
Remove all untracked files and directories from working copy:
```
git clean -fd
```
Remove all ignored files from working copy:
```
git clean -fX
```
Remove all ignored files and directories from working copy: 
```
git clean -fXd
```
Remove all untracked and ignored files from working copy:
```
git clean -fx
```
Remove all untracked and ignored files and directories from working copy:
```
git clean -fxd
```



## Remotes

Adds a remote named remote for the repository at url: 
```
git remote add remote url
```
Remove reference to remote repository named remote: all tracking branches and configuration settings for remote are removed:
```
git rm remote url
```
Delete the branch branch from the remote repository named remote:
```
git push remote :heads/branch
```
Prune deleted remote branches from git branch listing. These branches have already been removed from the remote repository named remote, but are still locally available in “remotes/remote”. 
```
git remote prune remote
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
Remove a single stashed state from the stash list and apply on top of the current working tree state. When no stash is given, the latest one:
```
git stash pop 
git stash pop <stash>
```
Lists all stashed changesets:
```
git stash list
```
Restore the changes recorded in the stash on top of the current working tree state. When no stash is given, applies the latest one (stash@{0}). The working directory must match the index:
```
git stash apply <stash>
```
Remove a single stashed state from the stash list. When no stash is given, it removes the latest one:
```
git stash drop 
git stash drop <stash>
```
Remove all the stashed states:
```
git stash clear
```
Creates and checks out a new branch named new-branch starting from the commit at which the stash was originally created, applies the changes recorded in stash to the new working tree and index, then drops the stash if that completes successfully. When no stash is given, applies the latest one:
```
git stash branch new-branch <stash>
```
Save your local modifications to a new stash, and run “git reset –hard” to revert them. This is the default action when no subcommand is given. If msg is not explicitly given, then it defaults to “WIP on branch” where “branch” is the current branch name:
```
git stash save <message>
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
Abort changes of a File:
```
git checkout -- <fileName>
```


 
## References

1. http://stackoverflow.com/questions/4965639/rollback-to-last-git-commit
2. http://stackoverflow.com/questions/2003505/delete-a-git-branch-both-locally-and-remotely
3. https://git-scm.com/book/de/v1/Git-Grundlagen-Tags
4. http://stackoverflow.com/questions/5480258/how-to-delete-a-remote-tag
5. http://github.com
6. https://training.github.com/kit/downloads/github-git-cheat-sheet.pdf
7. http://zackperdue.com/tutorials/super-useful-need-to-know-git-commands
8. https://www.thomas-krenn.com/de/wiki/Git\_Grundbefehle
9. http://www.git-tower.com/blog/git-cheat-sheet-de
