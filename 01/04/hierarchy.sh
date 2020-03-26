#!/bin/bash
echo Make a files directory:
mkdir files
echo Touch files a and b into directory files:
touch files/a files/b
echo Copy files to a new directory files:
cp files files2		# Normal cp fails (message can vary)
echo Copy should fail
echo "Recursive list directory contents with `-R` flag:"
ls -R
echo "Copy files to a new directory files with `-r` flag"
cp -r files files2	# Copy a directory with the recursive flag
ls files2
echo "Remove directory `files2` (should fail):"
rmdir files2
echo "Remove directory `files2` with option `-dfr`:"
rm  -dfr files2
echo "Recursive list of current directory:"
ls -R


