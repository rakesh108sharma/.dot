#!/bin/env bash
#
# keeping things clean

#####BEGIN

clear
echo "UPDATING..."
sleep 1
sudo xbps-install -uy
sudo xbps-install -Suy
sudo xbps-install -Suy

clear
echo "REMOVING orphans   AND   CLEARING cache..."
sleep 1
sudo xbps-remove -oy
sudo xbps-remove -O

clear
echo "CLEANING trash..."
rm -r "$HOME"/.trash/*

clear
echo "REMOVING old kernels..."
sleep 1
sudo vkpurge rm all

clear
echo "UPDATING tldr..."
tldr --update

clear
echo "TRIMMING..."
sudo fstrim /
sudo fstrim /home

clear
echo "Putztag ist vorbei."
echo

exit 0

##### END
