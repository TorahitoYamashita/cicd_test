#!/bin/bash

echo "Ran!!!!"
echo $1

IFS='.' read -ra ADDR <<< $1
echo ${ADDR[@]}
# for i in "${ADDR[@]}"; do
#     echo "$i"
# done