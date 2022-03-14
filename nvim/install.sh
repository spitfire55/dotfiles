#!/bin/sh

nvim_config_file=~/.config/nvim

mkdir -p ~/.config/

if [ ! -L "$nvim_config_file" ]; then
  ln -s ~/.dotfiles/nvim/nvim "$nvim_config_file"
fi
