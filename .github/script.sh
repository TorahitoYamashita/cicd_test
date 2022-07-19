#!/bin/bash

echo "Ran!!!!"
echo $1

IFS='.' read -ra ADDR <<< $1
echo ${ADDR[@]}
echo ${ADDR[0]}
echo ${ADDR[1]}
echo ${ADDR[2]}
# for i in "${ADDR[@]}"; do
#     echo "$i"
# done