#!/bin/dash
#
# sets the wallpaper diashow

# IF the diashow is already running THEN exit
running=$(pgrep -c wallpapershow) 
[ "$running" -gt 1 ] && echo "diashow already running..." && exit 1

echo "start diashow..."

# start the background process
{

  while true
  do
    cd "$HOME"/.wallpaper || exit
    wallpapers="$(ls)"

    for wallpaper in $wallpapers
    do
      hsetroot -full "$wallpaper"
      sleep 300
    done
  done

} &


exit 0


