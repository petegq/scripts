#!/bin/bash

# chmod +x extract_text.sh before use

# Usage: ./extract_text.sh input_file output.txt

if [ $# -ne 2 ]; then
  echo "Usage: $0 input_file output_file"
  exit 1
fi

input_file=$1
output_file=$2

# Ensure the input file exists
if [ ! -f "$input_file" ]; then
  echo "Input file not found!"
  exit 1
fi

# Clear the output file if it exists
> "$output_file"

# Set the extraction flag to false
extract=false

# Read the input file line by line
while read -r line; do
  # Check if the line contains "text"
  if [[ $line =~ "text" ]]; then
    # Set the extraction flag to true
    extract=true
    # Remove "text" from the line
    line=${line#*"text"}
  fi

  # Check if the line contains "trackingParams" and the extraction flag is true
  if [[ $line =~ "trackingParams" ]] && [ "$extract" = true ]; then
    # Set the extraction flag to false
    extract=false
    # Remove "trackingParams" from the line
    line=${line%"trackingParams"*}
  fi

  # If the extraction flag is true, append the line to the output file
  if [ "$extract" = true ]; then
    echo "$line" >> "$output_file"
  fi
done < "$input_file"

echo "Extraction complete. Results saved to $output_file."
