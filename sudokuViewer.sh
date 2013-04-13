#!/bin/bash

echo 'Sudoku Viewer by David Fischer (2011)'

if [ ! $# -eq 1 ]
then
  echo "Usage: ${0} sudokuResultFile"
  exit 1
fi

# 'Parse' file to an array
declare -a `sed 's/ //g' < ${1}`

# Compute grid dimensions
N_N=${#result[@]}
N=$(echo "scale=0; sqrt($N_N)" | bc -l)
sqrtN=$(echo "scale=0; sqrt($N)" | bc -l)
COLUMNS=`expr length $N`
let COLUMNS=$COLUMNS+1

# Display grid on a human-readable format !

index=0

for ((rowNb = 0; rowNb < $N; rowNb++))
do
  # Add some beauty to our grid !
  let rowMod=$rowNb%$sqrtN
  if [ $rowMod -eq 0 ]
  then
    echo
  fi

  for ((colNb = 0; colNb < $N; colNb++))
  do
    # Add some beauty to our grid !
    let colMod=$colNb%$sqrtN
    if [ $colMod -eq 0 ]
    then
      printf " |"
    fi

    # Display current grid's case
    printf "%${COLUMNS}s" "${result[$index]}"
    let index=$index+1
  done

  printf " |\n" # ... some beauty !
done
