#!/bin/sh

kitty_config_file=~/.config/kitty

mkdir -p ~/.config/

if [ ! -L "$i3_config_file" ]; then
	ln -s ~/.dotfiles/kitty/kitty "$kitty_config_file"
fi
