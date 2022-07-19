#!/usr/bin/env bash

echo "Ran!!!!"
echo $1

IFS='.' read -ra ADDR <<< $1
for i in "${ADDR[@]}"; do
    echo "$i"
done