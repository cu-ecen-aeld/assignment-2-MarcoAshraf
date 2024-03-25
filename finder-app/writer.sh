#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]
then
  echo "Error: Please provide both file path and content to write."
  exit 1
fi

writefile="$1"
writestr="$2"

# Extract directory path
filepath="${writefile%/*}"  # Remove filename from path

# Create directories if they don't exist
if [ ! -d "$filepath" ]
then
  mkdir -p "$filepath"  # Create parent directories recursively
  if [ $? -ne 0 ]
  then
    echo "Error: Failed to create directory structure for $writefile."
    exit 1
  fi
fi

# Create the file and write content
if ! echo "$writestr" > "$writefile"
then
  echo "Error: Failed to create file $writefile."
  exit 1
fi

exit 0
