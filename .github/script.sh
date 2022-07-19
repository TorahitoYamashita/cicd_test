#!/bin/bash
pwd
ls

cat "./.github/manifest.txt"
YEAR_AND_WEEK="$(date +"%y.%U.")"

IFS='.' read -ra ADDR <<< $1
echo ${ADDR[2]}

YEAR="$(date +"%y")"
WEEK="$(date +"%U")"

if [ "$WEEK" = "${ADDR[2]}" ]; then
    echo "Same week."
    VERSION=${YEAR_AND_WEEK}$((${ADDR[2]} + 1))
else
    echo "Next week."
    VERSION=${YEAR_AND_WEEK}1
fi

echo ${VERSION}

cat "./.github/manifest.txt"

echo ${VERSION} > "./.github/manifest.txt"

cat "./.github/manifest.txt"


