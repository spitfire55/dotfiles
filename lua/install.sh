#!/bin/sh

stylua_config_file=~/.config/stylua

mkdir -p ~/.config/

if [ ! -L "$stylua_config_file" ]; then
  ln -s ~/.dotfiles/lua/stylua "$stylua_config_file"
fi
