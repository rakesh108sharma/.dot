export PATH=$HOME/bin:$PATH:/usr/games
export PS1="\033[34m\n\A \w \n----$ \033[0m"
export EDITOR=micro
export PAGER=less
export LESS='-iMRS -x2'
export CLICOLOR=1
HISTFILE=$HOME/.ksh_history
HISTSIZE=20000

if command -v colorls > /dev/null ; then
  LS='colorls'
else
  LS='ls'
fi

alias yys='pkg_info -Q'
alias yyi='doas pkg_add -m -vvv'
alias yyr='doas pkg_delete -m -vvv'
alias yyu='doas pkg_add -u -m -vvv'
alias yyc='doas pkg_delete -a -m'
alias yyl='pkg_info -a'
alias xls='pkg_info -L | more'

alias ls="$LS -FHh"
alias ll='ls -l'
alias la='ls -lA'
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ...'
alias df='df -h'
alias du='du -ch'

alias svim='doas vim'
alias e='micro'
alias ee='emacsclient'
alias vv='vim'

#alias xterm='xterm -fa "Hack" -fs 24 -fullscreen'
alias ww='links www.duckduckgo.org'
alias chrome='chrome --enable-unveil'
alias qqq='doas halt -p'
