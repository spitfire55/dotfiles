#!/bin/sh

i3_config_file=~/.config/i3

mkdir -p ~/.config/

if [ ! -L "$i3_config_file" ]; then
  ln -s ~/.dotfiles/i3/i3 "$i3_config_file"
fi
