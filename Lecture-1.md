
# Why would you want to use the command line?

Good question. All those nice modern GUI's (graphical user interfaces) are tempting for rookies to ignore the command line, but actually, if you put in some effor to learn to use the command line, you will work **faster**, more **flexible** and be able to easily **automate** tedious and repetitive tasks.

Using the command line you are talking directly to your device its processor, where GUI's are an extra layer of abstraction, code and blah that slows stuff down, and are merely a wrapper around your command line's commands.

With command line, you can do EVERYTHING you can do with a GUI and **much more**, from listening to music, to browsing the web to programming beautiful web applications!

Plus, you will look like badass keyboard wizard and impress all the girls (or boys, whatever's your preference :)).

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

In a different context, different commands may be available. To see which commands are available you perform something we call *double-tab* , which literally means, pressing the tab-key two times, tab-tab. If nothing happens, type one letter, for example `l` , and you will see all commands available starting with 'l', OR there might be so many commands available that the shell will say "Display all 104 possibilities? (y or n)". If you press 'y', the shell will continue to display the commands. On the bottom of the page there may be a pager '---More---', because there are commands not yet visible on your screen. Press 'spacebar' to see the next batch of commands, or type 'q' to return to type a command.

Type `ls` , and do double-tab. You'll see 'ls' displayed as first command, followed with other commands like lsusb, lsblk, lsmod etc etc. Only worry about ls for now.

To execute the 'ls' command, press enter. This will show the contents of your current directory. On most systems, in your homefolder you'll find default folders like Desktop, Downloads, Documents and so on. Note that you see these folders as well in your graphical user interface. It are the same folders ;-).

### manual pages

But how can you figure out what 'ls' (or any other command) exactly does, and how it should be used? Exactly, this is why we should make use of the built in help system, called the 'manual pages'. There are multiple methods to get help on a command;

- type `ls --help` . This will display the short help for the command. Note that 'short' may seem relative :)
- type `man ls` . This will open the manual page for 'ls' in your terminal. 
- ask the interwebz

Open the manual page for ls, by typing `man ls`. A manual page is paged (navigate with up/down arrows) an can be searched: Type `/` and your keyword, then press enter to highlight the matching keywords. If there are multiple matches type `n` to see the next match, and shift+n to return to the previous match. Press `q` to close the manual page.

Open the manual page again and lets give it a top-down read. The first section shows the name, and a brief description of the command. The **synopsis** explains how the command should be typed. In our case of 'ls' you'll see:

```
SYNOPSIS
	ls [OPTION]... [FILE]...
```

So how does this translate to the shell? It could look something like this:

```
 bboy@laptop:~$ ls -l usernames.txt
                |  |      |-> the file, typed relative, the absolute path would be /home/bboy/usernames.txt
                |  |--------> an option, the option -l means that you want to show a list with extra info about the stuff listed
                |-----------> the command
```

To figure out which options are available, continu reading the manual page. After synopsis there is the section **description** , which lists all available options, complete with explanation. Take your time to read through a manual before frustrating yourself with trial and error commands. The extra time you invest in reading and understanding commands, will save you tons of time later.

If you have figured out the right command for a certain tasks, save it somewhere, so you don't have to memorize crazy long commands like `apt update && apt upgrade -y >> /var/log/update.log && less /var/log/update.log` (this line updates all the software on ubuntu and writes the output to a logfile, whereafter it'll open the logfile for you to inspect). 

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

# Users and permissions

You already know you're logged in to the terminal as a user (in our example bboy). On a ... ( tbc )

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
