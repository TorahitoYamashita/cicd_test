#!/bin/bash
pwd
ls

cat "./manifest.txt"
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

echo "before 1"
cat "./manifest.txt"
echo "after 1"

echo ${VERSION} > "./manifest.txt"

echo "before 2"
cat "./manifest.txt"
echo "after 2"
