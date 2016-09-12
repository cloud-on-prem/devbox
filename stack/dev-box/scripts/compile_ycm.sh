#!/bin/bash
cd ~/.config/nvim/plugged/YouCompleteMe/
git submodule update --init --recursive
~/.config/nvim/plugged/YouCompleteMe/install.py
