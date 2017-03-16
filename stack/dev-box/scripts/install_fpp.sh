#!/bin/bash
cd ~/
git clone https://github.com/facebook/PathPicker.git .PathPicker
cd .PathPicker
sudo ln -sf .PathPicker/fpp /usr/local/bin/fpp
