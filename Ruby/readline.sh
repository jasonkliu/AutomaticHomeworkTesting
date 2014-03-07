#!/bin/bash

echo "Script made by Jason Liu, March 2014"

# Reads files from pipe and performs actions
if [ -t 0 ]; then # if argc = 1 (no stdin)
   echo -n "Enter name of file to read: "
   read a         # store name of file in $a
fi

if [ -n "$a" ]; then # if $a is non-null
   if [ ! -e "$a" ]; then # if $a doesn't exist
      echo "File not found"
	  exit
   fi
   while read -r line ; do # Read each line in $a
      echo -e "$line" # TODO: Change to command
   done < $a
else
   while read -r line ; do # Read lines from stdin
      echo -e "$line" # TODO: Change to command
   done
fi

# Additional Tests

# Check for lines > 80 characters
grep -n '^.\{80\}' testfile > over.txt
if [ -s over.txt ]; then # if over.txt exists && size>0
   echo "Warning: Lines over 80 characters in file"
else  
   echo "Passed Test: No lines over 80 characters"
fi


