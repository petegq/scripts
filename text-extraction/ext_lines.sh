#!/bin/bash

# input=$1
input="input/transcript.json"

# search=$3
search="simpleText text"

IFS=' ' read -ra patterns <<<"$search"

# Iterate over the patterns
for pattern in "${patterns[@]}"; do
    output="output/${pattern}.txt"
    grep "\"${pattern}\"" "$input" >"$output"
    echo "Extracted lines with: ${pattern}"
done
