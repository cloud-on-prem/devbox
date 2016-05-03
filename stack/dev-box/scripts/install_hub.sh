#!/bin/bash
HUB_VERSION=$1
BASE_NAME=hub-linux-amd64-${HUB_VERSION}
URL=https://github.com/github/hub/releases/download/v${HUB_VERSION}/${BASE_NAME}.tgz
cd /tmp
wget ${URL}
sudo tar -xzf ${BASE_NAME}.tgz
sudo cp ${BASE_NAME}/bin/hub /usr/bin/hub
