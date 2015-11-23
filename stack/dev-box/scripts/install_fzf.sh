#!/bin/bash
VERSION=$1
TARGET_NAME=fzf
FILE_NAME=${TARGET_NAME}-${VERSION}-linux_amd64
cd /tmp
sudo wget -O ${TARGET_NAME}.tgz https://github.com/junegunn/fzf-bin/releases/download/${VERSION}/${FILE_NAME}.tgz
sudo tar -xzvf ${TARGET_NAME}.tgz
sudo mv $FILE_NAME ~/.fzf/bin/$TARGET_NAME
