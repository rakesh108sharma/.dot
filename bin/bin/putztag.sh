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
doas flatpak update -y

clear
echo -e "$f REMOVING old kernels... $r"
sleep 1
doas vkpurge rm all

clear
echo -e "$f REMOVING orphans... $r"
sleep 1
doas xbps-remove -oy

clear
echo -e "$f CLEARING cache... $r"
sleep 1
doas xbps-remove -O

clear
echo -e "$f CLEANING trash... $r"
doas rm -r "$HOME"/.trash/*

clear
echo -e "$f UPDATING tldr... $r"
tldr --update

clear
echo -e "$f UPDATING apropos... $r"
sudo makewhatis

clear
echo -e "$f TRIMMING... $r"
echo -e "\n\ntrimming: /"
doas fstrim /
echo -e "\ntrimming: /home"
doas fstrim /home
echo -e "\ntrimming: /media/SSD-120G"
doas fstrim /media/SSD-120G
echo -e "\ntrimming: /media/SSD-240G"
doas fstrim /media/SSD-240G

clear
echo -e "$f RKHUNTER... $r"
echo -e "\n\nupdating rkhunter"
doas rkhunter --update
echo -e "\nchecking for rootkits"
doas rkhunter -c --sk --rwo --propupd

echo
echo
echo -e "\033[32;40m Putztag ist vorbei. $r"
echo

exit 0
##### END
