#!/bin/bash

choice=$(echo -e "\
chromium
firefox
opera
tor
transmission
bash
zsh
xinitrc
rc
vim
THIS-menu" | dmenu -l 16)

case $choice in
chromium)
    chromium &
    ;;
firefox)
    firefox &
    ;;
opera)
    opera &
    ;;
tor)
    torbrowser-launcher &
    transmission-gtk &
    ;;
transmission)
    transmission-gtk &
    ;;
bash)
    st -e vim ~/.bashrc
    ;;
zsh)
    st -e vim ~/.zshrc
    ;;
xinitrc)
    st -e vim ~/.xinitrc
    ;;
rc)
    sudo st -e vim /etc/rc.conf
    ;;
vim)
    st -e vim ~/.vimrc
    ;;
THIS-menu)
    st -e vim ~/bin/my-menu.sh
    ;;
esac
