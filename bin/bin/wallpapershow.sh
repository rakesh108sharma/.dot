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
    list="$(ls)"

    for x in $list
    do
      hsetroot -full "$x"
      sleep 300
    done
  done

} &


exit 0


