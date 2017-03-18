#!/bin/bash
VERSION=$1
sudo /usr/local/bin/ruby-install ruby ${VERSION} --system --no-reinstall -- --enable-shared
