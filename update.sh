#!/usr/bin/env bash

if [[ -z "$1" ]]
then
  echo "USAGE: ./update.sh VERSION"
  echo "...where VERSION is the 7-digit sqlite version, like 3450300"
  exit 2
fi

set -euxo pipefail

TEMP=$(mktemp)
curl "https://sqlite.org/$(date +%Y)/sqlite-amalgamation-${1}.zip" > $TEMP
rm -r sqlite-amalgamation-*
unzip $TEMP -d .
sed -i "s/^sqlite3_folder = .*/sqlite3_folder = '$(ls -d sqlite-amalgamation-*)'/" meson.build
echo ok
