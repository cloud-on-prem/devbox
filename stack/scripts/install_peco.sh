#!/bin/bash
PECO_VERSION=$1
BASE_NAME=peco_linux_amd64
FILE_AR=${BASE_NAME}.tar.gz
cd /tmp
wget https://github.com/peco/peco/releases/download/v${PECO_VERSION}/${FILE_AR}
sudo tar -C -xzf ${FILE_AR}
sudo cp /tmp/${BASE_NAME}/peco /usr/local/bin/peco
sudo chmod +x /usr/local/bin/peco
sudo rm ${FILE_AR}
sudo rm -rf ${BASE_NAME}

