setxkbmap de

xset dpms 1800
xset s 1200

amixer set PCM 100%,100%   # max boost
 
compton &
clipit &
sudo ntpd &

while xsetroot -name "$(date +%a" "%d/%m/%g"   "%H:%M" ")"
    do 
        sleep 60 
    done &

{
  sleep 2
  xrandr --output HDMI-A-0 --mode 1280x720 &
  sleep 3
  pavucontrol-qt &
  tilda -h -g ~/.config/tilda/config_0 &
  sleep 3
  volumeicon &
  mount-devices.sh &
  wallpapershow.sh &
  amixer set Master 30%
  sleep 1
  qterminal &
  mimic "All systems online"
  chromium &
  sleep 5
  jupyter-notebook &
} &

exec dwm
