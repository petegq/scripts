#!/bin/bash

# Usage: ./dir_map.sh /path/to/directory
# Example: ./dir_map.sh /home/user
# chmod +x dir_map.sh before use


if [ -z "$1" ]
then
  echo "Please provide a directory path."
  exit 1
fi

DIRECTORY="$1"
OUTPUT_FILE="output/map.txt"
ERROR_FILE="output/error.txt"

echo "Generating system map for $DIRECTORY..."

# Using find command to recursively list directories and redirect errors to error.txt
find "$DIRECTORY" -type d 2>"$ERROR_FILE" > "$OUTPUT_FILE"

echo "System map generated and saved to $OUTPUT_FILE."
echo "Error output saved to $ERROR_FILE."
