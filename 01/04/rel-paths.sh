#!/bin/bash
echo "prints working directory"
pwd	# prints working directory
echo "creates a new directory named a"
mkdir a	# creates a new directory named a
echo "changes directory to a"
cd a	# changes directory to a
pwd	
echo "going up one directory using ..."
cd ..	# changes to up directory
pwd	
rm -d a   # removes a
