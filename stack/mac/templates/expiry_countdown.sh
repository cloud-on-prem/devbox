#!/bin/bash -e

export PATH=/usr/local/bin:$PATH
file=$1
expiry=$(gdate -f ${file} +%s)
now=$(gdate +%s)
if [ $expiry -ge $now ]; then
  echo $((expiry-now)) | awk '{ printf " Token Expiry: %02d:%02d", int($1/60),int($1%60) }'
fi
