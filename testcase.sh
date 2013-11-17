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
   echo "Directory does not exist ... please check your applications folder"
   exit
fi

# Copying files
if [ $a == "hw6.scm" ]
then
   cp hw6/hw6_testcases.scm "$direc"
   cp $a "$direc"
   cd "$direc"
elif [ $a == "hw7.scm" ]
then
   cp hw7/hw7_testcases.scm "$direc"
   cp $a "$direc"
   cd "$direc"
else
   echo ""
   echo "File not supported."
   exit
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Running in: $DIR"

# Running files
if [ $a == "hw6.scm" ]
then
   ./plt-r5rs hw6_testcases.scm > output.txt
elif [ $a == "hw7.scm" ]
then
   ./plt-r5rs hw7_testcases.scm > output.txt
else
   echo ""
   echo "File not supported."
   exit
fi

cp output.txt "$orig"

echo ""
echo "done"
