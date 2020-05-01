#!/bin/bash
#

run () {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

#xrandr --output HDMI-A-0 --mode 1280x720 &
sleep 2

setxkbmap de

xset dpms 1800
xset s 1200

amixer set PCM 100%,100%   # max boost

run pavucontrol-qt &
xrdb .Xresources &
run urxvtd -q -o -f
run picom -b & 
qterminal &
run darkhttpd ~/wiki/my_wiki/site/ --addr 192.168.1.22 --daemon

sleep 2
run volumeicon &
run chromium http://192.168.1.22:8080 &

sleep 2
amixer set Master %
run wallpapershow.sh &
run mount-devices.sh &

sleep 1
mimic -t "All systems online"
run jupyter-notebook &
run tilda -h -g ~/.config/tilda/config_0 &
run clipit &
run sudo ntpd &

