#!/bin/bash
#
# ! autostart.sh !
# sets the wallpaper diashow

##### BEGIN
## functions
dia() {
    # WRONG!
    # when expecting multiple strings USE arrays
    # always avoid 'ls'
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

dia2() {
    # WRONG
    # same as above
    while true; do
        wallpapers=$(fd . "$HOME/.wallpaper")
        herbe "start diashow..."

        for wallpaper in $wallpapers; do
            hsetroot -full "$wallpaper"
            sleep 300
        done
    done
}

dia3() {
    # use array notation
    # use globbing - builtin bash - no need for outside prg
    while true; do
        wallpapers=("$HOME"/.wallpaper/*)
        herbe "start diashow..."

        for wallpaper in "${wallpapers[@]}"; do
            hsetroot -full "$wallpaper"
            sleep 300
        done
    done
}

## main
# test if the diashow is already running
running=$(pgrep -c wallpapershow)
if [ ! "$running" -gt 1 ]; then
    dia3
else
    herber "diashow already running..."
fi

exit 0

##### END
