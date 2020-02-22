#!/bin/dash
#
# let me choose a wallpaper

# kill diashow  if wallpaper diashow is already running
pgrep wallpapershow && pkill wallpapershow && printf  "killed diashow!\n...and set new wallpaper."

 
cd "$HOME"/.wallpaper >/dev/null 2>&1 || exit

hsetroot -full "$(fd | dmenu -l 20)"

cd - >/dev/null 2>&1 || exit

exit 0
