# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

devmon &

if [[ "$(tty)" == "/dev/tty1" ]]; then
    pgrep Xorg || startx
fi
