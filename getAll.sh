#!/bin/bash

# Get multiple files from github with wget

# wget https://raw.githubusercontent.com/petegq/scripts/master/test1.txt

baseURL=raw.githubusercontent.com/petegq/scripts/master/test/

fileList=(
    test1.txt
    test2.txt
    test3.txt
    test4.txt
    test5.txt
)

for i in "${fileList[@]}"; do
    wget https://${baseURL}$i
done

# for i in {1..5}
# do
#     wget https://${baseURL}test$i.txt
# done
