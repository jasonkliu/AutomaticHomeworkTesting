#!/bin/bash

# Finds name of file
echo "Script made by Jason Liu, January 2014"
echo -n "Enter name of Homework (1-6,N1,N2): "
read a
echo ""

orig="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Written for C99, The C Programming Language 2nd Edition

# Assumes programs are already compiled, make works, etc. 
# TODO: Functionality to check this will be added in a future version

echo "Running in: $orig"
echo ""

echo -n "Enter test number (1-14): "
read b

# Running files
# for i in $(seq -w 01 $b); # Old version, works for numbers > 10 only
for i in $(seq -f %02g $b); 
do
  echo "t$i:"
  ./Hwk$A < ../Tests/t$i.c > t$i.X
  diff ../Tests/t$i.cs t$i.X
  echo ""
done

echo "done"
