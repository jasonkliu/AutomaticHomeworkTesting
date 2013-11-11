#!/bin/bash

# Finds name of file
echo "Script made by Jason Liu, November 2013"
echo -n "Enter name of file (*.scm): "
read a
# echo "$a"

# Written for Racket 5.3.6
direc=~/../../Applications/Racket\ v5.3.6/bin/

if [ ! -d "$direc" ]; then
   echo ""
   echo "Directory does not exist ... please check your Applications folder"
   exit
fi

cp hw6_testcases.scm  ~/../../Applications/Racket\ v5.3.6/bin/
cp $a  ~/../../Applications/Racket\ v5.3.6/bin/
cd ~/../../Applications/Racket\ v5.3.6/bin/

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Running in: $DIR"

./plt-r5rs hw6_testcases.scm > output.txt
