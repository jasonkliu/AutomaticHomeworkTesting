#!/bin/bash

echo "Script made by Jason Liu, March 2014"
echo "Create a new directory for the testing? "
echo -n "If no, just press enter... "
read b

if [ -n "$b" ]; then # if $b is non-null
   mkdir -p $b       # make $b and all intermediate dirs
   cd $b
   orig="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
   echo "Running in: $orig"
fi

git --version 2>&1 >/dev/null # find git --version
GIT_IS_AVAILABLE=$?           # should be 0 if git is installed
if [ $GIT_IS_AVAILABLE -ne 0 ]; then #...
   echo "Git is not available on your system. Please install it."
   exit
fi

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

# Check for lines > 80 characters
function over80
{
ls -1p > filelist # make a file list with each on one line
while read -r line ; do # Read lines from stdin
   grep -n '^.\{80\}' "$line" > over.txt # TODO: Hide stderr if >1
   if [ -s over.txt ]; then # if over.txt exists && size>0
      echo "Warning: Lines over 80 characters in file '$line'"
   fi
done < filelist
rm over.txt filelist
}
