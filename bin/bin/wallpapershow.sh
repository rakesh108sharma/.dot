#!/bin/dash
#
# ! autostart.sh !
# sets the wallpaper diashow

##### BEGIN

# IF the diashow is already running THEN exit
running=$(pgrep -c wallpapershow) 
[ "$running" -gt 1 ] \
    && { herber "diashow already running..." & } \
    && exit 1

herbe "start diashow..."


# start the background process
{

  while true
  do
    cd "$HOME"/.wallpaper || exit 1
    wallpapers="$(ls)"

    for wallpaper in $wallpapers
    do
      hsetroot -full "$wallpaper"
      sleep 300
    done
  done

} &


exit 0

##### END
