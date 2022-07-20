#!/bin/bash

set -ex

if [ -z "$1" ]; then
    echo 'ERROR: Missing input variable!'
    exit 1
fi

YEAR_AND_WEEK="v$(date +"%y.%U.")"
WEEK="$(date +"%U")"

IFS='.' read -ra ARRAY <<< $1

if [ "$WEEK" = "${ARRAY[2]}" ]; then
    VERSION=${YEAR_AND_WEEK}$((${ARRAY[2]} + 1))
else
    VERSION=${YEAR_AND_WEEK}1
fi

echo ${VERSION} > "./manifest.txt"