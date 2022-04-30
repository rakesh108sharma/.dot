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
export MANPAGER=less
export PAGER=less
export EDITOR=nano
export BROWSER=chromium
export HISTSIZE=10000
export HISTFILESIZE=10000
export TERMINAL=st
export SHELL=/bin/bash
export CDPATH='~'
export MINIO_ACCESS_KEY=maya
export MINIO_SECRET_KEY=alex67ander
export FFF_TRASH=~/.trash
export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export SDL_IM_MODULE='ibus'
export XMODIFIERS='@im=ibus'
export XDG_CONFIG_HOME="$HOME/.config"
#export TRANSMISSION_HOME=/home/maya/.config/transmission-daemon

#PS1='[\u@\h \W]\$ '
#PS1="\n${cyan}\h: ${reset_color} ${yellow}\w\n${reset_color}-> "
PS1='$(slcp $COLUMNS $?)'

shopt -s cdspell

#####   A L I A S   #####
### system
alias path='echo -e ${PATH//:/\\n} | less'
alias zzz='sudo /usr/bin/zzz'
alias rrr='sudo /usr/bin/reboot'
#alias qqq='sudo poweroff'
#alias fw='sudo iptables -nvL'
alias fwwatch='watch -n 5 sudo iptables -nvL'
alias ee='sudo micro $(sudo find /etc/ -type f |fzf)'
alias eee='clear && cd /etc && ls'
alias sss='clear && cd /var/service/ && ls && sudo sv s /var/service/*'
alias vsv='sudo vsv'
alias doas='doas --'
#alias resolv='sudo nano /etc/resolv.conf'

### terminal
alias ls='exa --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias c='clear'
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
alias yyr='echo -e "sudo xbps-remove\n" && sudo xbps-remove'
#yyrr = function fuzzy search AND remove
alias yyl='echo -e "sudo xbps-query -l | most\n" && sudo xbps-query -l | most'
alias yyi='echo -e "sudo xbps-install\n" && sudo xbps-install'
#yyii = function fuzzy search AND install
alias yyc='echo -e "sudo xbps-remove -o\n" && sudo xbps-remove -o'
alias yycc='echo -e "sudo xbps-remove -O\n" && sudo xbps-remove -O'

### other
alias cat='bat --pager less'
alias e='micro $(fd . $HOME -H -E anaconda3/ | fzf)'
alias v='vim-huge'
alias vv='vim $(fd . $HOME -H -E anaconda3/ | fzf)'
alias ww='vim-huge $HOME/vimwiki/INDEX.md'
alias gg='tuxi'
alias nn='newsboat'
alias pp='castero'
alias rr='curseradio'
alias grep='grep --color=auto'
alias rm='rm -I'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias qmv='qmv --editor=vim --format=destination-only'
alias qcp='qcp -e vim'
alias du='du -h | sort -h | tail -n 20'
alias df='df -h | grep /dev/sd | sort -k 1'
alias mplayer='mplayer -af volnorm'
alias wetter='curl -4 http://wttr.in/Eupen'
#alias yv='youtube-viewer --resolution=720p -C'
alias n='dnote'
alias f='sudo fd'
alias ?='duck'
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
# taskwarrior
alias t='clear; task due.not:someday'
alias tls='task ls due.not:someday'
alias tl='task list due.not:someday'
alias tla='clear; task -DELETED -COMPLETED all'
alias tbook='task minimal +book due.not:someday'
alias tbd='task minimal waiting +bd'
alias ta='task add'
alias tm='task mod'
alias te="task edit"
alias tapt='clear; task \( +apt or +dr \) -COMPLETED -DELETED all'
alias ti='clear; task +idee -COMPLETED -DELETED all'
alias th='clear; task +home -COMPLETED -DELETED all'
alias tg='clear; task +garten -COMPLETED -DELETED all'
alias tb='clear; task +buy -COMPLETED -DELETED all'
alias td='clear; task +do -COMPLETED -DELETED all'
tr() {
    task "$1" mod "recur:$2"
}
tbirthdate() {
    task add "$1 Geburtstag due:$2" until:due+1w wait:due-1m
}
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

yys() {
    echo -e "LOCAL\tsudo xbps-query -s\n" && sudo xbps-query -s "$1"
    echo
    echo -e "REPO\tsudo xbps-query -Rs\n" && sudo xbps-query -Rs "$1"
}

ys() {
    ag --nonumber -w "$1" "$HOME/voidpackages" || yss "$@"
}

yss() {
    ag --nonumber "$1" "$HOME/voidpackages" | most
}

yyii() {
    sudo xbps-install "$(xbps-query -Rs '' | fzy -l 25 | awk '{ print $2}')"
}

yyrr() {
    sudo xbps-remove "$(xbps-query -s '' | fzy -l 15 | awk '{ print $2}')"
}

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
mkcd() {
    mkdir -p -- "$*"
    cd -- "$*" || exit
}
copy() { scp "$@" void@192.168.1.12:; }

ex() {
    if [ -f $1 ]; then
        case $1 in
        *tar.bz2) tar xjf $1 ;;
        *tar.gz) tar xzf $1 ;;
        *.bz2) bunzip2 $1 ;;
        *.rar) unrar $1 ;;
        *.gz) gunzip $1 ;;
        *.tar) tar xf $1 ;;
        *.tbz2) tar xjf $1 ;;
        *.tgz) tar xzf $1 ;;
        *.zip) unzip $1 ;;
        *.Z) uncompress $1 ;;
        *.7z) 7z x $1 ;;
        *.deb) ar x $1 ;;
        *.tar.xz) tar xf $1 ;;
        *.tar.zst) unzstd $1 ;;
        *) echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        "'$1' is not a valid file"
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
        TITLE="$(echo $1 | sed 's/[a-z]/\U&/g')"
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

vic() {
    vim-huge $(which $1)
}

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

#source <(cod init $$ bash)
