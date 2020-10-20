#!/bin/dash
#
# ! autostart.sh !
# sets the wallpaper diashow

##### BEGIN
## functions
dia() {

    while true; do
        cd "$HOME"/.wallpaper || exit 1
        wallpapers="$(ls)"
        herbe "start diashow..."

        for wallpaper in $wallpapers; do
            hsetroot -full "$wallpaper"
            sleep 300
        done
    done

}

## main
# test if the diashow is already running
running=$(pgrep -c wallpapershow)
if [ ! "$running" -gt 1 ]; then
    dia
else
    herber "diashow already running..."
fi

exit 0

##### END
