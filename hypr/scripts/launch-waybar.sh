#!/bin/bash

CONFIG_FILES="$HOME/.config/waybar/config.jsonc $HOME/.config/waybar/style.css"

trap "killall waybar" EXIT

while true; do
  inotifywait -e create,modify $CONFIG_FILES
  waybar &
  killall waybar
done
