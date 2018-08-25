
# Command line 

The command line (cli, shell) is the interface between you (the user) and the operating system which interprets your commands and allows the computer to respond to your command. In theory you don't even need a desktop environment to use a shell on a computer, but generally people use a cli emulator like Terminal on Mac OS, or GnomeTerminal on Ubuntu. Don't worry too much about all those names, you'll get familiar over time. Folks here using Ubuntu can experience this by pressing ctrl+alt+f1 (or f2, to f7). Your desktop will dissappear and you'll get a white on black login screen. Don't panic, you can switch back to the desktop pressing ctrl+alt+f7 ...

There are different types of "command lines", called a **shell** . People who use Windows, are provided with the *CMD* shell and the *Powershell* shell. They both suck ;). UNIX based systems (like Ubuntu or MacOS), have many types of different shells, some of them are *bash*, *sh* and *dash*. We are going to focus on the **bash** shell, since this is the standard shell used on MacOS and Ubuntu.

The only thing you have to remember for now is that when we say "open your terminal", we mean that we'll start the application in your desktop environment to emulate a bash shell. When we say something like "get a new shell", we assume the application was already started, but you need a fresh tab or so.

While learning to use the cli may seem daunting at first, actually it is brilliantly equiped for this task. The bash shell has a built in help system, that take's some time to get used to, but will accellerate your learning experience dramatically if you make it a habbit to use it.

# Making sense of the bash shell

Open your terminal ;-), and maximize the window so you can get a good look. By default you should get a black background with white (or colored) text. The only thing it 'll display on startup is something like:

```
 bboy@laptop:~$ 
```

This tells us that the user *bboy* , is logged in at (*@*), a device named *laptop*. And, *:* , we are located on the device at location *~* which is an abbreviation for */home/bboy* (this is the the *home*-folder, since every user on a computer has a personal folder for storing personal settings and files).

After the *$* symbol you can start typing commands. This command will be executed at the location (here, /home/bboy) where you are at the moment of execution. Might sound confusing now, but it'll make sense soon. 

A 'location' on a computer is important, since the abstract idea of an unix operating system is virtually represented as a tree structure, called a filesystem.

# Filesystem 
Think of the filesystem as a tree starting with a special directory called the root which is the top of the tree - this is referred to as `/`. Every other directory is a child of this directory. 
```
                 ______ /_______
                /       |       \
               |        |        |
              dev    users      apps
                  /    |  \
            timir   unmesh  gijs
            /
        projects
        /
    python
```
My `home` directory in this case is `/users/unmesh` so when I type `cd` (with no arguments), I navigate to my home directory.

# Commands

## General syntax
`command_name param1 param2 [OPTIONS]`
In the above, square brackets denote the optional part of the command.
The square brackets are not supposed to be typed.
`param1` and `param2` are COMPULSORY parameters.
## Some commonly used commands

`ls` - show the contents of the directory. `ls -a` will show all hidden files. `ls -l` will show more files in long format (more details)

`pwd` - print the Present Working Directory. What directory am I in? 

`cd` - change directory to the one specified. If no directory is specified this will take you to your home directory. Remember that `.` is the current directory and `..` is the parent directory. So `cd .` changes the directory to the current directory (does nothing!). 

`echo` - prints the string on screen (on desktop/bash terminal). `echo -e "hello\n"` will interpret `\n` as newline.

`cat` - print the contents of the file - this will print the WHOLE file. If you want to pause printing after a full screen use the below command.

`less` - show one screen full of the file (spacebar/Enter moves forward and q stops printing)

`head` - show the beginning of a file e.g. `head -3` shows the first 3 lines of the file

`tail` - show the end of a file `tail -4` shows the last 4 lines of the file

`wc` - show the word count of a file (prints number of lines, words and characters in the file)

`CTRL-c` - stop what is happening on the command line 

`CTRL-z` - hard stop what is happening on the command line 

`mkdir` - create a new directory

`touch` - create an empty file

# vim
vim is an editor (like notepad on windows)
Sometimes it is a little hard to remember all the vim commands so here is a handy cheatsheet: https://www.fprintf.net/vimCheatSheet.html - with practice it will not seem so odd. 

`vim <filename>` will open a file in vim
When you are in vim there are two modes:
1. Insert mode - in this mode you can enter and change text
2. Command mode (also called escape mode) - in this mode you can issue commands to vim

When you are in vim `a` and `i` will put you in insert mode and `esc` will take you our of insert mode. If you get stuck in vim press `esc esc` (yes, twice) and then `:q` and this will take you back to the shell. Some commands we covered: 

`a` = Go to insert mode

`<ESC> :q` = quit file 

`<ESC> :wq` = save file and quit vim

`<ESC> :q!` = exit vim without saving

`<ESC> yy` = copy current line (the line you are on)

`<ESC> p` = paste what you last copied

Many commands can be preceeded by a number to repeat their action. For example, `<ESC> 4yy` copies 4 lines starting from where you entered the command. 
