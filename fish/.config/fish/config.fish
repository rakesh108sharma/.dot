if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""
set SHELL /bin/fish

set -gx TERM xterm-256color
#set -g fish_prompt_pwd_dir_length 1
#set -g theme_display_user yes
#set -g theme_hide_hostname no
#set -g theme_hostname always

set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_CACHE_HOME "$HOME/.cache"

if type -q exa
    alias ll "exa -lg --git --icons"
    alias la "exa -a --git --icons"
    alias lla "exa -lga --git --icons"
end

# packet manager
alias yyu='sudo xbps-install -Su'
alias yyx='sudo xbps-install -uy xbps'
alias yyr='sudo xbps-remove'
alias yyl='sudo xbps-query -l | most'
alias yyh='sudo xbps-query -H'
alias yyi='sudo xbps-install'
alias yyc='sudo xbps-remove -ov'
alias yycc='sudo xbps-remove -O'
alias yyccc='sudo xbps-remove -OO'
alias yys='xbps-query -Rs'

# sudo
alias vsv='sudo vsv'

# networking
alias ipl='ip -c -br a'
alias ipr='ip -c r'
alias nn='netstat -tuna'
alias nnm='nmap localhost'
alias nnd='cat /etc/resolv.conf'
alias wecke_media='wol 00:18:71:83:50:ac'
alias wecke_laptop='wol 00:26:2d:7c:3a:d3'
alias bye_media='ssh media sudo -S systemctl poweroff'
alias bye_laptop='ssh laptop sudo -S systemctl poweroff'

# divers
alias cat='bat --pager less'
alias e='micro'
alias ee='micro $(fd . $HOME -H -E anaconda3/ | fzf)'
alias n='nvim'
alias v='vim'
alias vv='vim $(fd . $HOME -H -E anaconda3/ | fzf)'
alias ww='vim-huge $HOME/vimwiki/INDEX.md'
alias ff='lf'
alias df='df -h | tail +2 | grep -Ev "tmpfs|boot|group" | sort -k 6'
alias duu='ncdu -e'
alias duf='duf -only local'
alias cc='clear'

# Created by `pipx` on 2022-07-21 16:12:30
set PATH $PATH /home/maya/.local/bin
