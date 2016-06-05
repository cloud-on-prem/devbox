#!/bin/bash
EXERCISM_VERSION=$1
BASE_NAME=exercism-linux-64bit
URL=https://github.com/exercism/cli/releases/download/v${EXERCISM_VERSION}/${BASE_NAME}.tgz
cd /tmp
wget ${URL}
sudo tar -xzf ${BASE_NAME}.tgz
sudo cp exercism /usr/bin/exercism
