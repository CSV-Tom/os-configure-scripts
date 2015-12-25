A common reason for this sort of thing is to set directories to 755 but files to 644. In this case there's a slightly quicker way than nik's find example:
```
chmod -R u+rwX,go+rX,go-w /path/to/base/dir
```
Meaning:

    * -R = recursively;
    * u+rwX = Users can read, write and execute;
    * go+rX = group and others can read and execute;
    * go-w = group and others can't write

The important thing to note here is that X acts differently to x. In manual we can read:

	> The execute/search bits if the file is a directory or any of the execute/search bits are set in the original (unmodified) mode.

In other words, chmod u+X on a file won't set the execute bit; and g+X will only set it if it's already set for the user.

References:
1. http://superuser.com/questions/91935/how-to-chmod-all-directories-except-files-recursively/91966
