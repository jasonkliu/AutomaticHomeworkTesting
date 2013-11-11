#!/bin/bash

# Written for Racket 5.3.6
cd ~/../../Applications/Racket\ v5.3.6/bin/

# Finds name of file
echo "Script made by Jason Liu, November 2013"
echo -n "Enter name of file (*.scm): "
read a
echo "$a"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Running in: $DIR"

