#!/bin/env zsh
#
# !! wird durch .xinitrc gestartet !!
# do all "wanted" things at system start

#xrandr --output HDMI-A-0 --mode 1280x720 &
sudo ntpd -s &
setxkbmap de

xset -dpms # standby - suspend -  off
xset s off # screensaver

pavucontrol-qt &

picom -b &

st &
#run darkhttpd ~/wiki/my_wiki/site/ --addr 192.168.1.22 --daemon

sleep 2
#chromium http://192.168.1.22:8080 &
chromium &
st -e system.sh &

#volumeicon & (wird jetzt von sxhkd erledigt)
#amixer set PCM 100%,100%   # max boost

wallpapershow.sh &

# hides the mouse when writing
xbanish &

tldr --update &
xbps-query -Rs '' >"$HOME/voidpackages" &
via -ro &

sleep 1
amixer set Master 20%
mimic -t "All systems online"
#jupyter-notebook &
clipit &
sxhkd &
sudo killall ntpd

doas /etc/zzz.d/resume/update &
