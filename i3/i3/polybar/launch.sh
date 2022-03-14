killall -q polybar
polybar main --config=~/.config/i3/polybar/config 2>&1 | tee -a /tmp/polybar.log & disown
