#!/bin/bash
VERSION=$1
BASE_NAME=phantomjs-${VERSION}-linux-x86_64
FILE_NAME=${BASE_NAME}.tar.bz2
cd /tmp
wget -O ${FILE_NAME} https://bitbucket.org/ariya/phantomjs/downloads/${FILE_NAME}
tar -xzvf $FILE_NAME
sudo mv $BASE_NAME/bin/phantomjs /usr/local/bin/phantomjs
sudo chmod +x /usr/local/bin/phantomjs
