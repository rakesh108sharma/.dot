#!/bin/env bash
#
# !! wird durch .xinitrc gestartet !!
# do all "wanted" things at system start

#xrandr --output HDMI-A-0 --mode 1280x720 &
#sudo ntpd -s &
setxkbmap de

xset -dpms # standby - suspend -  off
xset s off # screensaver

pavucontrol-qt &

picom -b &

st -e /bin/zsh &
#run darkhttpd ~/wiki/my_wiki/site/ --addr 192.168.1.22 --daemon

sleep 2
#chromium http://192.168.1.22:8080 &
chromium &
st -e system.sh &

#volumeicon & (wird jetzt direkt in DWM geregelt)

wallpapershow.sh &

# hides the mouse when writing
#xbanish &

tldr --update &
xbps-query -Rs '' >"$HOME/voidpackages" &
via -ro &

devmon &

sleep 1
amixer set Master 20%
mimic -t "All systems online"
#jupyter-notebook &
clipit &
emacs --daemon
xrdb -load .Xresources 
#sudo killall ntpd

doas /etc/zzz.d/resume/update &
