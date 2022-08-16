#!/bin/sh

picom_config_file=~/.config/picom

mkdir -p ~/.config/

if [ ! -L "$picom_config_file" ]; then
	ln -s ~/.dotfiles/picom/picom "$picom_config_file"
fi
