#!/bin/bash
VERSION=$1
cd /tmp
wget -O chruby-${VERSION}.tar.gz https://github.com/postmodern/chruby/archive/v${VERSION}.tar.gz
tar -xzvf chruby-${VERSION}.tar.gz
cd chruby-${VERSION}/
make install
