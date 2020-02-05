#!/bin/env bash
#
# keeping things clean

clear
sudo xbps-install -Su
sudo xbps-install -Su

sudo xbps-remove -o
sudo xbps-remove -O

rm -ri "$HOME"/.trash/*

sudo vkpurge rm all

tldr --update

sudo fstrim /

