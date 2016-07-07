#!/bin/bash
cd /tmp
git clone https://github.com/tmux/tmux.git
cd tmux
sudo sh autogen.sh
sudo ./configure && make
sudo cp tmux /usr/bin/tmux
