# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f .bash_colors ] && . .bash_colors

export PATH=$HOME/bin:$PATH
export MANPAGER=most
export PAGER=most
export EDITOR=nano
export BROWSER=chromium
export HISTSIZE=1000
export HISTFILESIZE=1000
export SHELL=/bin/bash
export CDPATH='~'

[ -f .bash_exports ] && . .bash_exports


#PS1='[\u@\h \W]\$ '
PS1="\n${cyan}\h: ${reset_color} ${yellow}\w\n${reset_color}-> "

shopt -s cdspell

#####   A L I A S   #####
# terminal
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -a'
alias l='exa -l'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias c='clear'
alias _='sudo'
alias eee='clear && cd /etc && ls'
alias sss='clear && ls /var/service/ && sudo sv s /var/service/*'
alias vsv='sudo vsv'

# packet manager
alias yyu='echo -e "sudo xbps-install -Su\n" && sudo xbps-install -Su'
#yys = function for searching packages
#yyss = function fuzzy search for a package 
alias yyr='echo -e "sudo xbps-remove\n" && sudo xbps-remove'
#yyrr = function fuzzy search AND remove
alias yyl='echo -e "sudo xbps-query -l | most\n" && sudo xbps-query -l | most'
alias yyi='echo -e "sudo xbps-install\n" && sudo xbps-install'
#yyii = function fuzzy search AND install
alias yyc='echo -e "sudo xbps-remove -o\n" && sudo xbps-remove -o'
alias yycc='echo -e "sudo xbps-remove -O\n" && sudo xbps-remove -O'

# fff file-manager
export FFF_FAV1=/etc
export FFF_FAV2=/etc/sv
export FFF_FAV3=/var/service
export FFF_FAV6=~/.config/mimeapps.list
export FFF_FAV7=~/.xinitrc
export FFF_FAV8=~/.config/fish/config.fish
export FFF_FAV9=~/.bashrc
export FFF_KEY_EXECUTABLE="O"     # Toggle executable flag

# other
alias cat='bat --pager less'
alias rr='ranger'
alias e='nano $(find $HOME | fzy -l 15)'
alias ee='sudo nano $(find /etc/ -type f |fzy -l 15)'
alias vv='vim $(find $HOME | fzy -l 15)'
alias v='vim'
alias gg='glances'
alias grep='grep --color'
alias zzz='echo -e "sudo zzz\n" && sudo zzz'
alias qqq='echo -e "sudo poweroff\n" && sudo poweroff'
alias qmv='qmv -e vim'
alias qcp='qcp -e vim'
alias du='du -ach | sort -hr | most'
alias mplayer='mplayer -af volnorm'
alias wetter='curl -4 http://wttr.in/Eupen'
alias yv='youtube-viewer --resolution=720p -C'
alias fw='sudo iptables -nvL'
alias fw_watch='watch -n 5 sudo iptables -nvL'
alias n='dnote'
alias f='sudo fd'
alias wiki-='taizen --lang=en'
alias wiki-de='taizen --lang=de'
alias wiki-es='taizen --lang=es'
alias wiki-fr='taizen --lang=fr'
alias wiki-la='taizen --lang=la'
#####   END ALIAS   #####



#####   F U N C T I O N S   #####
[ -f .bash_functions ] && . .bash_functions
#[ -f /usr/share/autojump/autojump.bash ] && . /usr/share/autojump/autojump.bash
#[ -f /usr/share/doc/fzf/key-bindings.bash ] && . /usr/share/doc/fzf/key-bindings.bash
#function xlocate { sudo xlocate $1 | cut -f1 | sort -u ; }

uu() { udevil umount /dev/sd$1 ; }     # unmount usb devices

myip ()
{
    echo
    #value=$(curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+')
    value=$(curl -s http://ipecho.net/plain)
    echo -e "${echo_bold_green} $value ${echo_normal}"
    echo
}

yys ()
{
echo -e "LOCAL\tsudo xbps-query -s\n" && sudo xbps-query -s "$1"
echo
echo -e "REPO\tsudo xbps-query -Rs\n" && sudo xbps-query -Rs "$1"
}

yyii ()
{
sudo xbps-install $(xbps-query -Rs '' | fzy -l 15 | awk '{ print $2}')
}

yyrr ()
{
sudo xbps-remove $(xbps-query -s '' | fzy -l 15 | awk '{ print $2}')
}

down4me () { curl -s "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g' ; }
#del () { mkdir -p /tmp/.trash && mv "$@" /tmp/.trash ; }
mkcd () {  mkdir -p -- "$*"; cd -- "$*" ; }
lsgrep () { ls --color=auto | grep --color=auto "$*" ; }
copy () { scp $@ void@192.168.1.12: ; }

# fzf fuzzy-finder functions
#fh () { eval $(history | fzf +s | sed 's/ *[0-9]* *//') ; }
#bind '"\C-R":"fh\n"'

# Run 'fff' with 'f' or whatever you decide to name the function.
ff() 
{
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}
        
#####   END FUNCTIONS   #####

# make LESS colourful
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;42;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'


############################################################


### HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between Bash memory and history file
#export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
### END HSTR
#export QT_SCALE_FACTOR=0.9

### starship prompt # must be the last entry in bashrc
eval "$(starship init bash)"
