#!/bin/bash
VERSION=$1
cd /tmp
wget -O ruby-install-${VERSION}.tar.gz \
    https://github.com/postmodern/ruby-install/archive/v${VERSION}.tar.gz
tar -xzvf ruby-install-${VERSION}.tar.gz
cd ruby-install-${VERSION}/
make install
