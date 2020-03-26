#!/bin/bash
echo Build files a-file ken and dmr
echo Ken Thompson > ken
echo Dennis M. Ritchie > dmr
touch a-file
echo Files are:
ls | grep -v files.sh 
echo Remove a a-file
rm a-file
echo Files are:
ls | grep -v files.sh 
echo Rename ken to KEN
mv ken KEN
echo Files are:
ls | grep -v files.sh 
echo Create a directory names
mkdir names
echo Move KEN into directories
mv KEN
echo Files in /names are:
ls /names | grep -v files.sh 
echo Move dmr into directories while changing to upper case
mv dmr names/DMR
echo Copy DMR into current directory
cp names/DMR .
echo Files in names are:
ls /names | grep -v files.sh 
echo Delete directories and files
rm D* K*
rmdir names
ls
