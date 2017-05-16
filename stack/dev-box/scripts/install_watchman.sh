#!/bin/bash
set -e

VERSION=$1
cd /tmp/
git clone https://github.com/facebook/watchman.git
cd watchman
git checkout v${VERSION}
sudo ./autogen.sh
sudo ./configure
sudo make
sudo make install
