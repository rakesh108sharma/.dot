#!/bin/env bash
#
# keeping things clean

#####BEGIN

f="\033[5;34;40m" # flash
r="\033[0m"       # reset

clear
echo -e "$f UPDATING... $r"
sleep 1
sudo xbps-install -uy
sudo xbps-install -Suy
sudo xbps-install -Suy

clear
echo -e "$f REMOVING orphans   AND   CLEARING cache... $r"
sleep 1
sudo xbps-remove -oy
sudo xbps-remove -O

clear
echo -e "$f CLEANING trash... $r"
rm -r "$HOME"/.trash/*

clear
echo -e "$f REMOVING old kernels... $r"
sleep 1
sudo vkpurge rm all

clear
echo -e "$f UPDATING tldr... $r"
tldr --update

clear
echo -e "$f TRIMMING... $r"
sudo fstrim /
sudo fstrim /home

clear
echo -e "\033[32;40m Putztag ist vorbei. $r"
echo

exit 0
##### END
