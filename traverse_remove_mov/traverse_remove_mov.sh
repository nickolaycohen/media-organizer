#!/bin/bash
echo "parameter #1: $1"

function traverse_directory {
  local directory="$1"

  for item in "$directory"/*; do
    if [ -d "$item" ]; then
      # If it's a directory, recurse
      echo "folder - $item"
      (cp remove_mov.sh "$item" && cd "$item" && ./remove_mov.sh && rm remove_mov.sh)
      traverse_directory "$item"
    # else
      # If it's a file, print its name
      # echo "$item is a file - passing ... "
    fi
  done
}

# Start traversing from the current directory
if [ -z "$1" ] 
  then 
    echo "no parameter - will traverse current folder ... "
    traverse_directory "."
  else
    echo "starting traverse from: $1"
    traverse_directory "$1"
fi


