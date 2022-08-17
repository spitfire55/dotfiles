#!/bin/sh

rofi_config_file=~/.config/rofi

mkdir -p ~/.config/

if [ ! -L "$rofi_config_file" ]; then
	ln -s ~/.dotfiles/rofi/rofi "$rofi_config_file"
fi
