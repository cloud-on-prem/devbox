#!/bin/bash
sudo dnf install -y python2 python2-dnf libselinux-python
echo "Provisioned, don't forget to scp the devbox key to ~/.ssh/"
