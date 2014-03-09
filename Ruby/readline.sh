#!/bin/bash

echo "Script made by Jason Liu, March 2014"
echo ""

# Check for lines > 80 characters
function over80 ()      # TODO: Dive deeper into folders
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

git --version 2>&1 >/dev/null # find git --version
GIT_IS_AVAILABLE=$?           # should be 0 if git is installed
if [ $GIT_IS_AVAILABLE -ne 0 ]; then 
   echo "Git is not available on your system. Please install it."
   exit
fi

orig="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Interactive mode: Create a new directory and read filename
if [ -t 0 ]; then # if argc = 1 (no stdin)
   echo -n "Enter name of file to read: "
   read a         # store name of file in $a

   if [ ! -e "$a" ]; then # if $a doesn't exist
      echo "File not found"
	  exit
   fi

   echo "Create a new directory for the testing? "
   echo -n "If no, just press enter... "
   read b

   if [ -n "$a" ] && [ -n "$b" ]; then # if $a and $b are non-null
      mkdir -p $b        # make $b and all intermediate dirs
      cp $a $b; cd $b    # else, copy $a into $b and cd there
   fi

   current="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
   echo "Running in: $current"
   while read -r line ; do # Read each line in $a
	  # Thanks to https://bbs.archlinux.org/viewtopic.php?id=111189
	  folder=`echo "${line##*/}/"`  # Find directory of cloning
      line=`echo -e $line | sed -e "s/https/git/"`
      line=`echo -e $line | sed -e "s/$/.git/"`
	  echo -e "$line" 
	  git clone $line; echo ""
	  cd $folder                      # Change to folder directory
	  over80                          # Check if over 80 lines in file
      cd ../; rm -rf $folder; echo "" # Clean up contents
   done < $a

# Quick mode: read from stdin and run automatically
else
   while read -r line ; do # Read lines from stdin
	  # Thanks to https://bbs.archlinux.org/viewtopic.php?id=111189
	  folder=`echo "${line##*/}/"`  # Find directory of cloning
      line=`echo -e $line | sed -e "s/https/git/"`
      line=`echo -e $line | sed -e "s/$/.git/"`
      echo -e "$line" 
	  git clone $line; echo ""
	  cd $folder                      # Change to folder directory
	  over80                          # Check if over 80 lines in file
      cd ../; rm -rf $folder; echo "" # Clean up contents
   done
fi

