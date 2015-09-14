#!/bin/bash
VIMRC=~/.nvimrc
nvim -N -u $VIMRC -c "try | NeoBundleUpdate! $* | finally | qall! | endtry" -U NONE -i NONE -V1 -e -s
