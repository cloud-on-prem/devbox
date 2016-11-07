#!/bin/bash -e

export PATH=/usr/local/bin:$PATH
file=$1
expiry=$(gdate -f ${file} +%s)
now=$(gdate +%s)
echo $((expiry-now)) | awk '{print int($1/60)":"int($1%60)}'
