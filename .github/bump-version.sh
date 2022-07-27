#!/bin/bash

set -ex

if [ -z "$1" ]; then
    echo 'error: missing version from manifest file!'
    exit 1
fi

echo "before update: $1"
cat "./manifest"

YEAR_AND_WEEK="$(date +"%y.%U.")"
WEEK="$(date +"%U")"

IFS='.' read -ra ARRAY <<< $1

if [ "$WEEK" = "${ARRAY[1]}" ]; then
    echo 'same week'
    VERSION=${YEAR_AND_WEEK}$((${ARRAY[2]} + 1))
else
    echo 'next week'
    VERSION=${YEAR_AND_WEEK}1
fi

echo ${VERSION} > "./manifest"

echo "after update: ${VERSION}"
cat "./manifest"