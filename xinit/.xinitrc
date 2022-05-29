# xrandr --output HDMI-A-0 --mode 1280x720 &
# exec dbus-launch --exit-with-session emacs -mm --debug-init

# stopps the complain:"XDG_RUNTIME_DIR not set" (by mpv etc.)
mkdir -p /tmp/${USER}-runtime && chmod -R 0700 /tmp/${USER}-runtime
export XDG_RUNTIME_DIR=/tmp/${USER}-runtime

~/bin/autostart.sh &


slstatus &

exec dwm
