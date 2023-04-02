#!/bin/bash

# Get a list of files from github with wget

wget -q -O - https://api.github.com/repos/petegq/scripts/ | grep -o '"name": "[^"]*' | cut -d '"' -f 4 | grep -v "README.md" | grep -v "LICENSE" | grep -v "getAll.sh" | while read line; do wget -q -O - https://raw.githubusercontent.com/petegq/scripts/master/$line; done
