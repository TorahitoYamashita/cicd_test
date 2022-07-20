#!/bin/bash

set -ex

pwd
ls -a
cat "./manifest.txt"

if [ -z "$1" ]; then
    echo 'ERROR: Missing input variable!'
    exit 1
fi

YEAR_AND_WEEK="v$(date +"%y.%U.")"
WEEK="$(date +"%U")"

IFS='.' read -ra ARRAY <<< $1

if [ "$WEEK" = "${ARRAY[1]}" ]; then
    echo 'same week'
    VERSION=${YEAR_AND_WEEK}$((${ARRAY[1]} + 1))
else
    echo 'next week'
    VERSION=${YEAR_AND_WEEK}1
fi

echo ${VERSION}
echo "before 1"
cat "./manifest.txt"
echo "after 1"

echo ${VERSION} > "./manifest.txt"

echo "before 2"
cat "./manifest.txt"
echo "after 2"
