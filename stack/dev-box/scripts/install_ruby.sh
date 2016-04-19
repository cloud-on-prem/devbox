#!/bin/bash
VERSION=$1
ruby-install ruby ${VERSION} --system --no-reinstall -- --enable-shared
