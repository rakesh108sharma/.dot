## .bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# shellcheck source=/dev/null
[ -f "$HOME"/.bash_colors ] && . "$HOME"/.bash_colors
[ -f "$HOME"/.bash_exports ] && . "$HOME"/.bash_exports

umask 027
### export
#export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export MANPAGER=most
export PAGER=less
export EDITOR=micro
export BROWSER=chromium
export HISTSIZE=10000
export HISTFILESIZE=10000
export TERMINAL=st
export SHELL=/bin/bash
export CDPATH=(.:/:$HOME)
export MINIO_ACCESS_KEY=maya
export MINIO_SECRET_KEY=alex67ander
export FFF_TRASH=~/.trash
export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export SDL_IM_MODULE='ibus'
export XMODIFIERS='@im=ibus'
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
#export TRANSMISSION_HOME=/home/maya/.config/transmission-daemon

#PS1='[\u@\h \W]\$ '
PS1="\n${cyan}\h: ${reset_color} ${yellow}\w\n${reset_color}-> "
#PS1='$(slcp $COLUMNS $?)'

shopt -s cdspell
shopt -s autocd
shopt -s direxpand

#####   A L I A S   #####
### system
alias path='echo -e ${PATH//:/\\n} | less'
alias zzz='sudo /usr/bin/zzz'
alias rrr='sudo /usr/bin/reboot'
#alias qqq='sudo poweroff'
#alias fw='sudo iptables -nvL'
alias fwwatch='watch -n 5 sudo iptables -nvL'
alias eee='clear && cd /etc && ls'
alias sss='clear && cd /var/service/ && ls && sudo sv s /var/service/*'
alias vsv='sudo vsv'
alias doas='doas --'
#alias resolv='sudo nano /etc/resolv.conf'

### terminal
alias st='st -f "Liberation Mono:pixelsize=16:antialias=true:autohint=true" -g 128x36'
alias ls='exa --color=always --group-directories-first'
alias ll='exa -lg --color=always --group-directories-first --git --icons'
alias la='exa -a --color=always --group-directories-first --git --icons'
alias lt='exa -aT --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
#alias c='clear'
alias _='sudo'
alias error='echo -e "\033[5;31;40mERROR:\033[0m\033[31;40m"'
alias romy='cd ~/video/ROMY'

### packet manager
alias yyu='echo -e "sudo xbps-install -Su\n" && sudo xbps-install -Su'
alias yyx='sudo xbps-install -uy xbps'
#yys = function for searching packages
#ys = function for searching packages with 'ag' in file 'voidpackages' - word
#yss = F() for searching packages with 'ag' in file 'voidpackages' - greedy
#yyss = function fuzzy search for a package
#yyp = function search for package starting with "$1"
alias yyr='echo -e "sudo xbps-remove\n" && sudo xbps-remove'
#yyrr = function fuzzy search AND remove
alias yyl='echo -e "sudo xbps-query -l | most\n" && sudo xbps-query -l | most'
alias yyi='echo -e "sudo xbps-install\n" && sudo xbps-install'
#yyii = function fuzzy search AND install
alias yyc='echo -e "sudo xbps-remove -o\n" && sudo xbps-remove -o'
alias yycc='echo -e "sudo xbps-remove -O\n" && sudo xbps-remove -O'

### other
alias cat='bat --theme=OneHalfDark'
alias E='sudo micro'
alias e='micro'
alias ee='micro "$(fd . $HOME -H -E anaconda3/ | fzf)"'
alias n='nvim'
alias V='sudo vim'
alias v='vim'
alias vv='vim "$(fd . $HOME -H -E anaconda3/ | fzf)"'
alias ww='vim-huge $HOME/vimwiki/INDEX.md'
alias gg='tuxi'
alias nn='newsboat'
alias pp='castero'
alias rr='curseradio'
alias ff='lf'
alias grep='grep --color=auto'
alias rm='rm -I'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias qmv='qmv --editor=vim --format=destination-only'
alias qcp='qcp -e vim'
alias du='du -h | sort -h | tail -n 20'
alias duu='ncdu -e'
#alias df='df -h | grep /dev/sd | sort -k 1'
alias df='df -h | tail +2 | grep -Ev "tmpfs|boot|group" | sort -k 6'
alias mplayer='mplayer -af volnorm'
alias wetter='curl -4 http://wttr.in/Eupen'
#alias yv='youtube-viewer --resolution=720p -C'
alias f='sudo fd'
alias wiki-='taizen --lang=en'
alias wiki-de='taizen --lang=de'
alias wiki-es='taizen --lang=es'
alias wiki-fr='taizen --lang=fr'
alias wiki-la='taizen --lang=la'
alias math='speedcrunch'
alias yt='youtube-dl -F'
alias ytv='youtube-dl -f 22'
alias yta='youtube-dl -f 140'
alias yta3='youtube-dl -x --audio-format mp3 --prefer-ffmpeg'
alias chc='check_connections'
alias explain='lynx explainshell.com'
# taskwarrior
#    alias t='clear; task due.not:someday'
#    alias tls='task ls due.not:someday'
#    alias tl='task list due.not:someday'
#    alias tla='clear; task -DELETED -COMPLETED all'
#    alias tbook='task minimal +book due.not:someday'
#    alias tbd='task minimal waiting +bd'
#    alias ta='task add'
#    alias tm='task mod'
#    alias te="task edit"
#    alias tapt='clear; task \( +apt or +dr \) -COMPLETED -DELETED all'
#    alias ti='clear; task +idee -COMPLETED -DELETED all'
#    alias th='clear; task +home -COMPLETED -DELETED all'
#    alias tg='clear; task +garten -COMPLETED -DELETED all'
#    alias tb='clear; task +buy -COMPLETED -DELETED all'
#    alias td='clear; task +do -COMPLETED -DELETED all'
#    tr() {
#        task "$1" mod "recur:$2"
#    }
#    tbirthdate() {
#        task add "$1 Geburtstag due:$2" until:due+1w wait:due-1m
#    }
#####   END ALIAS   #####

#####   F U N C T I O N S   #####

[ -f "$HOME"/.bash_functions ] && . "$HOME"/.bash_functions

uu() { udevil umount /dev/sd"$1"; } # unmount usb devices

myip() {
    echo
    #value=$(curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+')
    value=$(curl -s http://ipecho.net/plain)
    echo -e "${echo_bold_green} $value ${echo_normal}"
    echo
}

### functions for package managment
# search for packages locally and remotely
yys() {
    echo -e "LOCAL\tsudo xbps-query -s\n" && sudo xbps-query -s "$1"
    echo
    echo -e "REPO\tsudo xbps-query -Rs\n" && sudo xbps-query -Rs "$1"
}

# search for packages in file=voidpackages
ys() {
    ag --nonumber -w "$1" "$HOME/voidpackages" || yss "$@"
}

yss() {
    ag --nonumber "$1" "$HOME/voidpackages" | most
}

yyp() { yys $1 | cut -d' ' -f 2- | grep -e "^${1}"; }

#yyii() {
#    sudo xbps-install "$(xbps-query -Rs '' | fzy -l 25 | awk '{ print $2}')"
#}

# install package
yyii() {
    choice=$(xbps-query -Rs '' | dmenu)
    choice="${choice#* }"
    sudo xbps-install "${choice%% *}"
}

# remove package
yyrr() {
    sudo xbps-remove "$(xbps-query -s '' | fzy -l 15 | awk '{ print $2}')"
}
### END functions for package managment

kernel() {
    clear
    uname -a
    echo
    ls /boot/v*
    echo
    vkpurge list
}

# in order for 'which' to find aliases and functions
which() {
    (
        alias
        declare -f
    ) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot "$@"
}
export -f which

run() {
    if ! pgrep "$1"; then
        "$@" &
    fi
}

down4me() { curl -s "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g'; }

copy() { scp "$@" void@192.168.1.12:; }

ex() {
    if [[ -z "$1" ]]; then
        echo "no filename given!"
        echo "USAGE: ex FILENAME"
        return
    elif [ -f "$1" ]; then
        case "$1" in
        *tar.bz2) tar xjf "$1" ;;
        *tar.gz) tar xzf" $1" ;;
        *.bz2) bunzip2" $1" ;;
        *.rar) unrar "$1" ;;
        *.gz) gunzip "$1" ;;
        *.tar) tar xf "$1" ;;
        *.tbz2) tar xjf "$1" ;;
        *.tgz) tar xzf "$1" ;;
        *.zip) unzip "$1" ;;
        *.Z) uncompress "$1" ;;
        *.7z) 7z x "$1" ;;
        *.deb) ar x "$1" ;;
        *.tar.xz) tar xf "$1" ;;
        *.tar.zst) unzstd "$1" ;;
        *) echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

mman() {
    NOTE="$(fd ${1}.md $HOME/vimwiki/)"
    if [ ! -f "$NOTE" ]; then
        echo "No mman entry for $1" >&2
        return 1
    fi

    case $2 in
    edit)
        ${EDITOR:-vim} "$NOTE"
        ;;
    *)
        TITLE="${1^^}"
        SECTION="my manpages"
        AUTHOR="Axel"
        DATE="$(date +'%B %d, %Y' -r "$NOTE")"

        pandoc \
            --standalone \
            --from markdown \
            --to man \
            --metadata title="$TITLE" \
            --metadata author="$AUTHOR" \
            --metadata section="$SECTION" \
            --metadata date="$DATE" \
            "$NOTE" | groff -T utf8 -man | most
        ;;
    esac
}

cheat() {
    curl cheat.sh/"$1" | more
}

### some change dir functions
# cd with dmenu or edit file with micro
c() {
    if [[ -z $1 ]]; then
        #choice=$(ls -a --color=never | dmenu | cut -d' ' -f1)
        choice=$(find . -maxdepth 1 | dmenu | cut -d' ' -f1)
        if [[ -d "$choice" ]]; then
            cd "$choice" || exit
        elif [[ -f "$choice" ]]; then
            micro "$choice"
        fi
    else
        cd "$1" || exit
    fi
}

mkcd() {
    mkdir -p -- "$*"
    cd -- "$*" || exit
}

# helper function for bettercd
cd() {
    [[ $# -eq 0 ]] && return
    builtin cd "$@" || exit
}

# cd and edit with fzf and preview
bettercd() {
    cd "$1" || exit
    if [ -z "$1" ]; then
        while true; do
            selection="$(\ls -a | fzf --height 85% --reverse --info hidden --prompt "choice: " \
                --preview ' cd_pre="$(echo $(pwd)/$(echo {}))"
                    echo $cd_pre
                    echo
                    ls -a --color=always "${cd_pre}"
                    bat --style=numbers --theme=ansi --color=always {} 2>/dev/null' \
                --bind alt-j:preview-down,alt-k:preview-up \
                --prompt "make a selection: " \
                --preview-window=right:70%)"
            if [[ -d "$selection" ]]; then
                cd "$selection" || exit
            elif [[ -f "$selection" ]]; then
                vim "$selection"
            else
                break
            fi
        done
    fi
}
alias cd='bettercd'
### END cd functions
#####   END FUNCTIONS   #####

############################################################

### make LESS colourful
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;42;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'

### HSTR configuration - add this to ~/.bashrc
alias hh=hstr                   # hh to be alias for hstr
export HSTR_CONFIG=hicolor      # get more colors
shopt -s histappend             # append new history items to .bash_history
export HISTCONTROL=ignorespace  # leading space hides commands from history
export HISTFILESIZE=10000       # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE} # increase history size (default is 500)
# ensure synchronization between Bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
### END HSTR
#export QT_SCALE_FACTOR=0.9

complete -C /home/maya/bin/mc mc
eval "$(zoxide init bash)"
#source <(cod init $$ bash)
