#!/bin/bash

# Usage: ./generate_system_map.sh /path/to/directory
# Example: ./generate_system_map.sh /home/user

if [ -z "$1" ]
then
  echo "Please provide a directory path."
  exit 1
fi

DIRECTORY="$1"
OUTPUT_FILE="test/map.txt"
ERROR_FILE="test/error.txt"

echo "Generating system map for $DIRECTORY..."

# Using find command to recursively list directories and redirect errors to error.txt
find "$DIRECTORY" -type d 2>"$ERROR_FILE" > "$OUTPUT_FILE"

echo "System map generated and saved to $OUTPUT_FILE."
echo "Error output saved to $ERROR_FILE."
