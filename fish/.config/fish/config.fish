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
alias yyi='sudo xbps-install'
alias yyc='sudo xbps-remove -o'
alias yycc='sudo xbps-remove -O'
alias yys='xbps-query -Rs'

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
