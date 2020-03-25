#!bin/bash
ls xyz > output	# results in a error xyz doesn't exist
ls xyz 2> output # redirects channel `2` to file
ls -l a-file xyz > output 2> error # Redirect output and error
cat output
cat error
