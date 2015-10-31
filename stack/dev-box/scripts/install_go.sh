#!/bin/bash
GO_VERSION=$1
FILE=go${GO_VERSION}.linux-amd64.tar.gz

wget https://storage.googleapis.com/golang/${FILE}
sudo tar -C /usr/local -xzf ${FILE}
rm ${FILE}

