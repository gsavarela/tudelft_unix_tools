# Input and output Redirection

_\`One of the most remarkable things about Unix is the ability to redirect the input that a command receives, or the output that is produced by a command.  This is the topic of this unit.  As always, remember to try out on your own the examples we are examining.\`_
 
## Output redirection

_\`A great innovation of Unix is the ability to redirect the output of any command to a file Using the echo command, I output the first verse of Rudyard Kipling\`s If poem: If you can keep your head when all about you.  Note the twist here: I added greater than if-1 at the end of echo, and nothing appeared at the output.  However, this greater than sign redirected the output of echo into a file named if-1.  To list the contents of this file, we use the `cat` command. `cat` stands for concatenate; it concatenates the input files into its output.\`_

```
> echo If you can keep your head when all about you > if-1	# Output redirection
> cat if-1
If you can keep your head when all about you
```

_\`There\`s also a way to append material to a file.  After echoing the second verse: Are losing theirs and blaming it on you, I use the double greater than sign followed by the filename if-1, and if-1 now contains both the first and the second verse.  I can verify that again using the `cat` command.\`_

```
> echo Are losing theirs and blaming it on you, >> if-1	# Append to a file
> cat if-1
If you can keep your head when all about you
Are losing theirs and blaming it on you,
```

_\`Let\`s now create a second file with the next two verses of the If poem following the same procedure.\`_

_\`If you can trust yourself when all men doubt you,\`_

... _\`is redirected to a file named if-2, and finally\`_

_\`But make allowance for their doubting too.\`_

... _\`is appended to the end of the same file using again the double greater than sign.  If I concatenate if-2, we see the verses it contains.\`_

```
> echo If you can trust yourself when all men doubt you, > if-2	# Redirect to a file
> echo But make allowance for their doubting too. >> if-2  # Append to afile
is appended to the end of the same file using again the double greater than sign.
> cat if-2
If you can trust yourself when all men doubt you, 
But make allowance for their doubting too.
```

_\`Next, I can combine the two files, if-1 and if-2, into a single output through the `cat` command.\`_

```
> cat if-1 if-2

If you can keep your head when all about you
Are losing theirs and blaming it on you,
If you can trust yourself when all men doubt you, 
But make allowance for their doubting too.
```
_\`I can also redirect the output of `cat` itself.  Actually, any output of any command can be redirected.  In this way, I concatenate if-1 and if-2, redirecting the output to a file named "if".  Then I `cat` "if" without redirection to get the complete first stanza on the screen.\`_


```
> cat if-1 if-2 > if
> cat if
If you can keep your head when all about you
Are losing theirs and blaming it on you,
If you can trust yourself when all men doubt you, 
But make allowance for their doubting too.
```
## The standard error channel

_\`Some commands may fail with an error.  You run a command and an error appears.  You wouldn\`t want the error to be redirected to a file Because this would make the error disappear into the redirected output file.  And you may not find out until it\`s too late Unix solves this problem by having all commands sending their error messages on a special channel called the standard error.\`_

_\`Let\`s first create a file for later use.  If I list another file named xyzzy, that doesn\`t already exist here, and redirect the output of ls into a file named output, we notice that the error message: ls: cannot access xyzzy, isn\`t redirected to the output file; instead it appears on the screen.\`_

```
> touch afile
> ls xyzzy > output	# Display error message
ls: cannot access xyzzy
```

_\`On the other hand, if the output file didn\`t previously exist, it now does but is empty.  To redirect the error of the ls command, we need to add number 2 before the greater than sign, in order to redirect the channel number 2, which represents the standard error output.  Now, the error message of ls is redirected to the file named output.  If I `cat` output, we see that it actually contains the error message.\`_

```
> cat output
> ls xyzzy 2>output
> cat output
ls: cannot access xyzzy
```


_\`To do that, I list the two files, afile and xyzzy, sending the output of the first to the previous output file, and then the output of the second to a file named error, so that the standard error goes to file error.  Now, if I `cat` output, I get the listing of afile, and if I `cat` error, I get the error message.\`_

```
> ls -l afile xyzzy >output 2>error  # Redirect output and error
> cat output
-rw-r--r--  1 user staff  0 Mar 17 18:09 a-file
> cat error
ls: xyz: No such file or directory
```

## Paging

_\`What do you do when a command produces far more output than what can fit on the screen?  The `less` command, which we also saw as part of the manual command, allows us to view a file page by page.\`_

_\`As an example, typing `less` in the location of the system\`s word dictionary, which is `/usr/share/dict/words`, shows us the first page of words and then pauses, allowing us to type space to see the next page, q to quit, What do you do when a command produces far more output than what can fit on the screen?  The `less` command, which we also saw as part of the manual command, allows us to view a file page by page.\`_


```
> more /usr/share/dict/words

```
 
## Input Redirection

_\`As you might expect it\`s also possible to redirect a command\`s input to come from a file `bc` stands for basic calculator and is an arbitrary precision calculator.  By typing `bc` we enter the command mode of the calculator.  For example, entering 40 + 2 returns the result 42.  To specify a decimal precision for the results, we set the scale variable to a desired number of digits.\`_

_\`In this way, by setting scale equal to 60 and asking for the square root of 2, we get the square root of 2 with a precision of 60 digits.\`_

```
> bc
> 40
40
> scale = 60
> sqrt(2)
```

_\`As another example, let\`s try to automate an operation by saving it into a file.  Our task is to calculate how much rice can fit in on a chess board by placing one grain of rice onto the first square, two grains of rice to the second square, four grains to the next one, eight grains, 16, 32 and so on to the following squares.  In other words, this is the operation of 2 raised to the power of 64 minus 1, which I save into a file named chess-rice.  Now, if I run `bc` followed by `less` than chess-rice, in order for `bc` to take its standard input from the file, we get the total grains of rice that can fit on a chess board.\`_

```
>  echo 2 ^64 -1 >chess-rice
>  bc <chess-rice

```

_\`As a final example, recall the verses of the If poem that we saved in a file named if.  By running the `cat` command with the minus n option, which numbers the lines of its input, and specifying as input the file named if, the verses of the If poem are displayed in numbered lines.\`_

```
> cat -n <if

```

_\`This concludes our foundations unit on input and output redirection; stay with us!\`_

## References

- [UNIX For Beginners; Brian W. Kernighan](https://wolfram.schneider.org/bsd/7thEdManVol2/beginners/beginners.pdf) (Original Unix user documentation)
- [An Introduction to the UNIX Shell; S. R. Bourne](https://wolfram.schneider.org/bsd/7thEdManVol2/shell/shell.pdf) (Original Unix user documentation)
- [Shell Command Language](https://pubs.opengroup.org/onlinepubs/9699919799/idx/shell.html)(Unix standard specification) 
- [BC - An Arbitrary Precision Desk-Calculator Language; Lorinda Cherry, Robert Morris](https://wolfram.schneider.org/bsd/7thEdManVol2/bc/bc.pdf) (Original Unix user documentation)
- [more](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/more.html)(Unix command specification) 
- [bc](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/bc.html)(Unix command specification) 
