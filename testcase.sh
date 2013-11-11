#!/bin/bash

# Finds name of file
echo "Script made by Jason Liu, November 2013"
echo -n "Enter name of file (*.scm): "
read a

orig="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Written for Racket 5.3.6
direc=~/../../Applications/Racket\ v5.3.6/bin/

# Checks if directory exists
if [ ! -d "$direc" ]; then
   echo ""
   echo "Directory does not exist ... please check your Applications folder"
   exit
fi

cp hw6_testcases.scm "$direc"
cp $a "$direc"
cd "$direc"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Running in: $DIR"

if [ $a == "hw6.scm" ]
then
   ./plt-r5rs hw6_testcases.scm > output.txt
else
   echo ""
   echo "File not supported."
fi

cp output.txt "$orig"

# Remove files
# rm output.txt; rm hw6_testcases.scm; rm hw6.scm
