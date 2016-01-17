
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

## Tag
```
git tag
```

