## The command line prompt

_\`I spend many hours each day working on the Unix shell. A shell is a program that sits between you and the operating system, and allows you to enter commands, process them and see the results. In this unit we'll see how to enter commands, how we can change their options, how to find out more about each command, and how to edit our operations. Please open up a terminal on your computer, and try out what we'll be examining together. Let's get to the Unix command line prompt.\`_


_\`The dollar sign you see here is the shell's prompt. It tells you that it's waiting for input from you. Depending on your shell's configuration some additional information may precede it, such as your login name, the computer's name or the current directory. The echo command echoes its arguments, which means it prints its arguments on its standard output, in this case on our screen.\`_


```
> echo hello world!
hello world!
```

_\`If I run echo hello world!, hello and world! are its two arguments, and these will appear on the screen. The arguments of each command are separated by one or more spaces. A command takes its arguments and operates according to them. In this case echo will output them separated by a single space. If I enter echo a followed by multiple spaces and then b, the result is still a, a single space, and b.\`_

```
> echo a		b
a b
```

_\`Let's now try a different command: date Date displays the current date. On the shell we can follow a command or begin a line with a hash character, which is a comment; anything following the hash character is ignored.
In this case, as you see, I get the date again.\`_

```
> date
Mon Mar 23 16:18:21 WET 2020
> date      # this is a comment
Mon Mar 23 16:19:40 WET 2020
```

_\`In this course I'll use the hash character to annotate the commands I'll be using.\`_

## Editing

_\`All Unix shells support command-line editing keys. Touch is another command. It creates a file with the name specified, or it updates the file's timestamp to the current time. If we want to type another command similar to the previous one, we can use the up arrow in order to get the previous command, and then edit it; for example add the file with a longer name.\`_

```
> touch a-file
> touch a-file-with-longer-name		# press `up` key to get previous command
```

_\`To see the files in the current directory, we use the ls command. This shows us the two files I have created: a-file and a-file-with-a-longer-name.\`_

```
> ls
a-file
a-file-with-a-longer-name
```

_\`It's possible to configure the command line editor in order to follow the conventions of the editor we use. You can find detailed instructions online. Nevertheless, most shells are configured in a way that allows us to move forward and backward on the command line, and to delete characters using the backspace. Try to avoid using the delete key, because in some configurations this doesn't do what we might expect it to do.\`_

## Enter long file names

_\`A handy shortcut is the ability to enter long file names. Here, I use a touch command to create a file with a really long filename. If I use ls to see the contents of the current directory, we see that this file has been created. Now, if I want to specify the file again, I can simply type the command I want, the first few characters that uniquely specify the filename, and then press the tab key in order to let the shell complete the filename automatically.\`_ 

```
> touch really-long-file-name
> ls
really-long-file-name
> touch really-long-file-name		# press `tab` for auto completion
```
## Interrupt execution

_\`What do you do when you want to interrupt a command's execution? Here I'm entering the sleep command which waits for the specified number of seconds to elapse; 60 in this case. If I don't want to wait for 60 seconds, I can press Ctrl-C which immediately gives me back control, interrupting the command that was being executed.\`_

```
> sleep 60
^C⏎
```

## Command options


_\`Let's now see how we can change a command's behavior. I begin by creating two files: a and b. If I list the current directory, I see them here. If I want to find out more details about these files, I pass the l option to ls. This is specified with a minus and the letter l. This means a long listing, which shows more details about the files: the creation date, the owner, the permissions, and the file.\`_

```
> touch a
> touch b
> ls
a b
> ls -l			# Specify option to list files in long format
-rw-r--r-- 1 user staff    0 Mar 23 16:41 a
-rw-r--r-- 1 user staff    0 Mar 23 16:41 b
```

_\`Another option is the r, the reverse option, which shows the files in reverse order. Some commands allow us to specify the options in a so-called long format by preceding them with two minuses and using a long name. For example, ls - - reverse again lists the files in reverse order, but this time the option is more readable.\`_

```
> ls --reverse		# Specify option to list files in reverse order
b a
```
_\`We can combine options. So ls -l -r will use both a long file format, and list the files in reverse order.\`_

```
> ls -l -r 		# Specify two short options
-rw-r--r-- 1 user staff    0 Mar 23 16:41 b
-rw-r--r-- 1 user staff    0 Mar 23 16:41 a
b a
```

_\`Options can also be combined by putting them together after the minus sign. So ls -lr is the same as ls -l -r it lists the files in reverse order and in long file format.\`_

```
> ls -lr 		# Combine two short options
-rw-r--r-- 1 user staff    0 Mar 23 16:41 b
-rw-r--r-- 1 user staff    0 Mar 23 16:41 a
b a
```

_\`Some options allow us to specify an argument by following a space after the option and then the argument. For example, touch -t allows us to use a specific timestamp. The argument 2004 8th month 13th day is the timestamp that will be used for the file. In long options we specify the option's argument by using an equals sign. For example, the invocation touch -time equals the timestamp has the same effect as the previous one, and if we list the file we see that its timestamp is August 13th, 2004.\`_

```
> touch	-t 200408132045 olympic-opening # Specify short option with argument
> ls -l olympic-opening
-rw-r--r-- 1 user staff 0 Aug 13 2004 olympic-opening
> touch	--date=2004-08-13T20:45 olympic-opening # Specify longoption with argument
> ls -l olympic-opening
-rw-r--r-- 1 user staff 0 Aug 13 2004 olympic-opening
```

## Get help

_\`Right, but you may ask me: How can I remember all the command line options? The man command shows the documentation of a specific command. So man ls shows the documentation of ls, the manual page of ls, including all the options in both their short and long format. The manual appears page by page by pressing the space button, while with q we can quit the manual listing and return to the command prompt.\`_

## Built-in help

_\`Some commands even offer built-in help. A command's built-in help appears on the screen by writing the command and the long option - -help. So sleep - -help shows a brief listing of the options that the sleep command can accept, and what it actually does. This concludes our foundations unit on the command-line interface;\`_

_\`stay with us!\`_

## References

- [Utility Conventions](https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap12.html) (Unix standard specification)
- [date](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/date.html) (Unix command specification)
- [echo](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/echo.html) (Unix command specification)
- [ls](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/ls.html) (Unix command specification)
- [touch](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/touch.html) (Unix command specification)
- [man](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/man.html) (Unix command specification)
- [sleep](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/sleep.html) (Unix command specification)
