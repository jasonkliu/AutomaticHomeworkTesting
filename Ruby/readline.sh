#!/bin/bash
# Thanks to https://bbs.archlinux.org/viewtopic.php?id=111189

echo "Script made by Jason Liu, March 2014"
echo ""

# Check for lines > 80 characters
function over80 ()     
{
ls -1p > filelist # make a file list with each on one line
while read -r line ; do # Read lines from stdin
   grep -n '^.\{80\}' "$line" > over.txt 2>/dev/null
   GREP_STATUS=$?
   #echo "$line: $GREP_STATUS"
   #if [ $GREP_STATUS -gt 1 ]; then  # TODO: if >1, recursively check
   #   cd $line
   #   over80
   if [ -s over.txt ]; then # if over.txt exists && size>0
      echo "Warning: Lines over 80 characters in file '$line'"
   fi
done < filelist
rm over.txt filelist
}

# Check if git, capybara, rspec, and sinatra are installed
git --version 2>&1 >/dev/null 
GIT_IS_AVAILABLE=$?           # should be 0 if git is installed
gem list capybara -i 2>&1 >/dev/null
CAPY_IS_AVAILABLE=$?
gem list rspec -i 2>&1 >/dev/null
RSPEC_IS_AVAILABLE=$?
gem list sinatra -i 2>&1 >/dev/null
FRANK_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -ne 0 ]; then 
   echo "Git is not available on your system. Please install it."
   exit
elif [ $CAPY_IS_AVAILABLE -ne 0 ]; then 
   echo "Capybara is not available on your system. Please install it."
   exit
elif [ $RSPEC_IS_AVAILABLE -ne 0 ]; then 
   echo "Rspec is not available on your system. Please install it."
   exit
elif [ $FRANK_IS_AVAILABLE -ne 0 ]; then 
   echo "Sinatra is not available on your system. Please install it."
   exit
elif [ ! -e "rspec" ] || [ ! -d "spec/" ]; then
   echo ".rspec file or spec/ directory is missing. Please find it."
   exit
fi

orig="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # find pwd

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
      cp $a $b; cd $b    # copy $a into $b and cd there
   fi

   current="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
   echo "Running in: $current"
   while read -r line ; do # Read each line in $a
      folder=`echo "${line##*/}/"`  # Find directory of cloning
      line=`echo -e $line | sed -e "s/https/git/"`
      line=`echo -e $line | sed -e "s/$/.git/"`
      echo -e "$line" 
      git clone $line >/dev/null 2>&1
      cd $folder                       # Change to folder directory
      cp $orig/rspec .rspec            # Copy rspec file in
      mkdir spec/                      # Make a spec/ directory
      cp -r $orig/spec/ spec/          # Copy spec/ directory in
      rspec                            # Run rspec tests in folder
      over80                           # Check if over 80 lines in file
      cd ../; rm -rf $folder           # Clean up contents
      echo "------------------------------------------------"; echo ""
   done < $a

# Quick mode: read from stdin and run automatically
else
   while read -r line ; do # Read lines from stdin
      folder=`echo "${line##*/}/"`  # Find directory of cloning
      line=`echo -e $line | sed -e "s/https/git/"`
      line=`echo -e $line | sed -e "s/$/.git/"`
      echo -e "$line" 
      git clone $line >/dev/null 2>&1
      cd $folder                       # Change to folder directory
      cp $orig/rspec .rspec            # Copy rspec file in
      mkdir spec/                      # Make a spec/ directory
      cp -r $orig/spec/ spec/          # Copy spec/ directory in
      rspec                            # Run rspec tests in folder
      over80                           # Check if over 80 lines in file
      cd ../; rm -rf $folder           # Clean up contents
      echo "------------------------------------------------"; echo ""
   done
fi

