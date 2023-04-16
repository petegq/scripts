#!/bin/bash

# input=$1
input="text-extraction/input/transcript.json"

# output_folder=$2
output_folder=text-extraction/output/

# search=$3
search="text simpleText"

IFS=' ' read -ra patterns <<< "$search"

# Iterate over the patterns
for pattern in "${patterns[@]}"; do
    output="$output_folder${pattern}.txt"
    grep "\"${pattern}\"" "$input" >"$output"
    echo "Extracted lines with: ${pattern}"
done

