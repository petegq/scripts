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

echo "Generating system map for $DIRECTORY..."

# Using find command to recursively list directories and suppress errors
find "$DIRECTORY" -type d 2>/dev/null > "$OUTPUT_FILE"

echo "System map generated and saved to $OUTPUT_FILE."
