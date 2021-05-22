devmon &

export PATH=$HOME/bin:$HOME/.local/bin:$PATH

if [[ "$(tty)" == "/dev/tty1" ]]; then
    pgrep dwm || startx
fi
