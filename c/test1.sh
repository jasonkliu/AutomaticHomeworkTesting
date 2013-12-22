#!/bin/bash

# Finds name of file
echo "Script made by Jason Liu, December 2013"
echo -n "Enter name of Homework (1-6,N1,N2): "
read a
echo ""

orig="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Written for C99, The C Programming Language 2nd Edition

# Assumes programs are already compiled, make works, etc. 
# TODO: Functionality to check this will be added in a future version

echo "Running in: $orig"
echo ""

echo -n "Enter test number (10-40 inclusive): "
read b

# Running files
for i in $(seq -w 01 $b);
do
  echo "t$i"
  ./Hwk$a < ../Tests/t$i.c > t$i.X
  diff ../Tests/t$i.html t$i.X
done


echo ""
echo "done"
