#!/bin/env bash
#
# keeping things clean

#####BEGIN

f="\033[5;34;40m" # flash
r="\033[0m"       # reset

clear
echo -e "$f UPDATING... $r"
sleep 1
doas xbps-install -Suy xbps
doas xbps-install -Suy
doas xbps-install -Suy

clear
echo -e "$f REMOVING orphans   AND   CLEARING cache... $r"
sleep 1
doas xbps-remove -oy
doas xbps-remove -O

clear
echo -e "$f CLEANING trash... $r"
rm -r "$HOME"/.trash/*

clear
echo -e "$f REMOVING old kernels... $r"
sleep 1
doas vkpurge rm all

clear
echo -e "$f UPDATING tldr... $r"
tldr --update

clear
echo -e "$f TRIMMING... $r"
doas fstrim /
doas fstrim /home

clear
echo -e "\033[32;40m Putztag ist vorbei. $r"
echo

exit 0
##### END
