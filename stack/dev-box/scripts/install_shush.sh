#!/bin/bash
SHUSH_VERSION=$1
BASE_NAME=shush_linux_amd64
URL=https://github.com/realestate-com-au/shush/releases/download/v${SHUSH_VERSION}/${BASE_NAME}
cd /tmp
wget ${URL}
sudo cp ${BASE_NAME} /usr/bin/shush
sudo chmod +x /usr/bin/shush
