#!/bin/bash
VERSION=$1
TARGET_NAME=fzf
FILE_NAME=${TARGET_NAME}-${VERSION}-linux_amd64
cd /tmp
wget -O ${FILE_NAME}.tgz https://github.com/junegunn/fzf-bin/releases/download/0.10.5/${FILE_NAME}.tgz
tar -xzvf ${FILE_NAME}.tgz
mv $FILE_NAME /usr/bin/$TARGET_NAME
rm ${FILE_NAME}.tgz
