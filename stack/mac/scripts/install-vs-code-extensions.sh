#!/bin/bash
set -euf -o pipefail

FILE=$1
while IFS= read -r EXTENSION
do
  echo "Installing ${EXTENSION}.."
  code --install-extension "${EXTENSION}"
done < "$FILE"
