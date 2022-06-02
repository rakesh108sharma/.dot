#!/bin/env bash
#
# !! wird durch .xinitrc gestartet !!
# do all "wanted" things at system start

#xrandr --output HDMI-A-0 --mode 1280x720 &
setxkbmap de

xset -dpms # standby - suspend -  off
xset s off # screensaver

pavucontrol-qt &

picom -b &

st -e fish &

sleep 2
chromium &
st -e system.sh &

#volumeicon & (wird jetzt direkt in DWM geregelt)

wallpapershow.sh &

# hides the mouse when writing
xbanish &

tldr --update &
xbps-query -Rs '' >"$HOME/voidpackages" &
#via -ro &

devmon &
#scrond &

sleep 1
amixer set Master 20%
mimic -t "All systems online"
clipit &
#emacs --daemon
xrdb -load .Xresources

check_connections &
doas /etc/zzz.d/resume/update &
