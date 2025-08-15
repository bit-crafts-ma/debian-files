#!/bin/bash

set -e

if [ -d "$HOME/.profile" ]; then
  cp ~/.profile ~/.profile.old
fi

if [ -d "$HOME/.bash_aliases" ]; then
  cp ~/.bash_aliases ~/.bash_aliases.old
fi

if [ -d "$HOME/.bash_exports" ]; then
  cp ~/.bash_exports ~/.bash_exports.old
fi

cp -r config/* ~/.config

cp  profile/.bash_aliases ~/ 
cp  profile/.bash_exports ~/ 
cp  profile/.profile ~/ 

sudo cp -r profile/.* /etc/skel 
sudo cp  bin/* /usr/local/bin/

sudo cp  etc/sudoers/* /etc/sudoers.d/
