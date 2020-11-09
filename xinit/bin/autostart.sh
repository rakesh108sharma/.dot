#!/bin/env bash
#
# !! wird durch .xinitrc gestartet !!
# do all "wanted" things at system start

# funktioniert nicht
run() {
    if ! pgrep "$1"; then
        "$@" &
    fi
}

#xrandr --output HDMI-A-0 --mode 1280x720 &
#sleep 2
sudo ntpd -s &
setxkbmap de

xset -dpms # standby - suspend -  off
xset s off # screensaver

pavucontrol-qt &

#xrdb .Xresources &        # nicht wirklich nötig
#urxvtd -q -o -f       # nicht wirklich nötig
picom -b &

#qterminal &
st &
#run darkhttpd ~/wiki/my_wiki/site/ --addr 192.168.1.22 --daemon

sleep 2
chromium http://192.168.1.22:8080 &
st -e system.sh &

sleep 2
volumeicon &
#amixer set PCM 100%,100%   # max boost

wallpapershow.sh &

# hides the mouse when writing
xbanish &

#mount-devices.sh &
tldr --update &
xbps-query -Rs '' >"$HOME/voidpackages" &
via -ro &

sleep 1
amixer set Master 20%
mimic -t "All systems online"
#jupyter-notebook &
#tilda -h -g ~/.config/tilda/config_0 &
clipit &
sxhkd &
sudo killall ntpd
#watch_wiki_and_mkdocs.sh &
