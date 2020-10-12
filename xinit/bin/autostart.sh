#!/bin/bash
#
# !! wird durch .xinitrc gestartet !!
# do all "wanted" things at system start

run () {
    if ! pgrep "$1" ;
    then
        "$@"&
    fi
}

#xrandr --output HDMI-A-0 --mode 1280x720 &
sleep 2

setxkbmap de

xset -dpms                 # standby - suspend -  off
xset s off                 # screensaver

amixer set PCM 100%,100%   # max boost

run pavucontrol-qt &      
#xrdb .Xresources &        # nicht wirklich nötig
#run urxvtd -q -o -f       # nicht wirklich nötig
run picom -b & 
#qterminal &
st &
run darkhttpd ~/wiki/my_wiki/site/ --addr 192.168.1.22 --daemon

sleep 2
run volumeicon &          # könnte direkt in qtile ersetzt werden
run chromium http://192.168.1.22:8080 &
st -e system.sh &

sleep 2
amixer set Master 20%
run wallpapershow.sh &
run mount-devices.sh &
run tldr --update &
xbps-query -Rs '' > "$HOME/voidpackages" &

sleep 1
mimic -t "All systems online"
#run jupyter-notebook &
run tilda -h -g ~/.config/tilda/config_0 &
run clipit &
#run sudo ntpd &
run watch_wiki_and_mkdocs.sh &


