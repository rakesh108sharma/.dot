setxkbmap de

xset dpms 300

amixer set PCM 100%,100%   # max boost
 
compton &
clipit &
sudo ntpd &

while xsetroot -name "$(date +%a" "%d/%m/%g"   "%H:%M" ")"
    do 
        sleep 60 
    done &

{
  sleep 5
  xrandr --output HDMI-A-0 --mode 1280x720 &
  sleep 5
  pavucontrol-qt &
  tilda -h -g ~/.config/tilda/config_0 &
  sleep 5
  volumeicon &
  mount-devices.sh &
  wallpapershow.sh &
  sleep 1
  mimic "All systems online"
} &

exec dwm
