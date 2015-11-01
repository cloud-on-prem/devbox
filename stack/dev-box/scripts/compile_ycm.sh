#!/bin/bash
cd ~/.config/nvim/bundle/YouCompleteMe/
git submodule update --init --recursive
~/.config/nvim/bundle/YouCompleteMe/install.py
