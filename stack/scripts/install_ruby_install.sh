#!/bin/bash
VERSION=0.5.0
cd /tmp
wget -O ruby-install-${VERSION}.tar.gz \
    https://github.com/postmodern/ruby-install/archive/v${VERSION}.tar.gz
tar -xzvf ruby-install-${VERSION}.tar.gz
cd ruby-install-${VERSION}/
make install
