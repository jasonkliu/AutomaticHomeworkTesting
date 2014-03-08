#!/bin/bash

# Finds name of file
echo "Script made by Jason Liu, December 2013"
echo ""

orig="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Written for C99, The C Programming Language 2nd Edition

# Assumes programs are already compiled, make works, etc. 
# TODO: Functionality to check this will be added in a future version

echo "Running in: $orig"
echo ""

# Running files
# for i in $(seq -w 01 1000000000);
# for i in {1..1000000000}
for i in {1..500}
do
  echo $i
  j="$(./binary1 <<< $i)"
  k="$(./binary2 <<< $i)"
  # echo $j
  # echo $k

  if [ "$j" -ne "$k" ]
  then
     echo "$j"
     echo "$k"
     exit
  fi

done

echo "done"
