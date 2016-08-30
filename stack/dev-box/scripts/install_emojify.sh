#!/bin/bash
URL=https://raw.githubusercontent.com/mrowa44/emojify/master/emojify
DEST=/usr/local/bin/emojify
cd /tmp
wget ${URL}
sudo cp ./emojify ${DEST}
sudo chmod +x ${DEST}
