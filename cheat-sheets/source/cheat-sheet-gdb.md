
# GDB 

## Local debugging

### Compiling
Compile your C/C++ program with -g option. This allows the compiler to collect the debugging information:
```
g++ -g -Wall -O3  main.cc -o myprogram
```

### Break point

Set up a break point inside C/C++ program. The debugger will stop at the break point, and gives you the prompt to debug.
```
break <line-number>
break [file-name]:<line-number>
break [file-name]:<function-name>
```

### Execute program
```
gdb myprogram
run [args]
```
The program would execute until the first break point, and give you the prompt for debugging. Examples:
```
print <var-name>
print i
p i
p <var-name>
```

### Continue, stepping over and in

There are three kind of gdb operations at a break point. They are continuing until the next break point, stepping in, or stepping over the next program lines:

* c or continue : Jump to next break point,
* n or next : Execute next line as single instruction,
* s or step : Goes into the function and executes it line by line,
* l or list : Print the source code in the debug mode;

## Command shortcuts

* ENTER : Pressing enter key would execute the previously executed command again,
* c or continue : Jump to next break point,
* n or next : Execute next line as single instruction,
* s or step : Goes into the function and executes it line by line,
* l or list : Print the source code in the debug mode,
* bt or backgrack : Print backtrace of all stack frames,
* pt or ptype : Return type of var or show details of structure,
* help [Topicname] : View help for a particular gdb topic,
* quit : Exit;

### Display

### Break points

| Command                                | Description                                                |
|:-------------------------------------- |:---------------------------------------------------------- |
| b [ filename:] <line-number>           | Set break point in line
| b [ filename:] <function>              | Set break point at the beginning of a function
| b [ filename:] <line-number> if expr   | Set conditional breakpoint
| watch <var|expr>                       | Add watchpoint for variable or expression
| info break                             | Lists breakpoints and watchpoints
| delete                                 | Deletes all breakpoints
| delete [N]                             | Delete breakpoint N (see 'info break')
| disable [N]                            | Disable breakpoint N (see 'info break') 


## Remote debugging
 
### Installation

Install remote server for the GNU Debugger.
```
remote@~$ sudo apt-get install gdbserver
```

### Syntax

```
remote@~$ gdbserver <comm> <program> [args ...] 
```

### Examples
 
Using a serial port:
```
remote@~$ gdbserver /dev/com1 myprogram --verbose 
```

Start gdb as you normally would, with the target program  as the first argument:
```
local@~$ target remote /dev/ttyb
```

```
local@~$ target remote <ip-address>:2345
```

Using a TCP connection:
```
remote@~$ gdbserver localhost:6666 program
```

Attach to running programs:
```
remote@~$ gdbserver <comm> --attach PID
```

Launch in multi-process mode:
```
remote@~$ gdbserver --multi localhost:6666
```


```
ssh user@xyz.example.com
gdbserver :6666 --attach 5411
```

```
gdb -q
target remote xyz.example.com:6666
```

### stdio pipes

GDB and gdbserver can communicate over stdio pipes, so you can chain commands. Lets do that first example again, with pipes:
```
gdb -q
target remote | ssh -T xyz.example.com gdbserver - --attach 5312
```
The **-** in gdbserver’s argument list replaces the **:6666** in the previous example. It tells gdbserver we’re using stdio pipes rather than TCP port 6666. Attention: There’s no security in GDB’s remote protocol.


You can enter Docker containers
```
gdb -q
target remote | sudo docker exec -i e0c1afa81e1d gdbserver - --attach 58
```

gdbserver can do more than just attach, you can start programs with it too:
```
gdb -q
target remote | sudo docker exec -i e0c1afa81e1d gdbserver - /bin/sh
```

Or you can start it without any specific program, and then tell it what do do from within GDB. This is by far the most flexible way to use gdbserver.  You can control more than one process, for example:
```
gdb -q
target extended-remote | ssh -T root@xyz.example.com gdbserver --multi -
attach 774
add-inferior
inferior 2
attach 871
info inferiors
```

## References

1. [gdb] https://www.gnu.org/software/gdb/
2. [gdb] http://developerblog.redhat.com/2015/04/28/remote-debugging-with-gdb/
3. [gdb] http://www.linux-magazin.de/Ausgaben/2005/04/Auf-der-Pirsch 
4. [valgrind] http://valgrind.org/
5. [splint] http://www.splint.org/
6. [splint] http://www.linux-magazin.de/Ausgaben/2003/05/Flusen-Sieb
7. [splint] http://www.linux-magazin.de/Ausgaben/2003/06/Vollwaschmittel

