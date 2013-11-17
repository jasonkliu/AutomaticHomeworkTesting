#!/bin/bash

# Removes files from your Racket directory
echo "Script made by Jason Liu, November 2013"

orig="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Written for Racket 5.3.6
direc=~/../../Applications/Racket\ v5.3.6/bin/

# Checks if directory exists
if [ ! -d "$direc" ]; then
   echo ""
   echo "Directory does not exist ... please check your applications folder"
   exit
fi

cd "$direc"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Running in: $DIR"

# Remove files
rm output.txt; rm hw6_testcases.scm; rm hw6.scm; rm hw7_testcases.scm; rm hw7.scm

echo ""
echo "done"
