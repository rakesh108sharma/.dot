# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
setopt nohup

#export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export PATH=$PATH:~/.roswell/bin
export EDITOR=micro
export MANPAGER=most
export PAGER=bat
export SHELL=/bin/zsh
export TERMINAL=st
export XDG_CONFIG_HOME="$HOME/.config"

### ALIAS - suffix
alias -s {mp3,mp4,mkv,webm,m3u}=mpv
alias -s pdf=mupdf
alias -s md=vim
alias -s {txt,sh}=nano

### ALIAS - packet manager
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

### ALIAS - divers
alias d='cd ~/downloads/torrents/'
alias romy='cd ~/video/ROMY'
alias maha='cd ~/Dokumente/maharaj'
alias e='emacsclient -c -n $(fd . $HOME -H -E anaconda3/ | fzf)'
alias ee='emacsclient -c -n'
alias v='vim $(fd . $HOME -H -E anaconda3/ | fzf)'
alias vv='vim-huge'
alias ww='vim-huge $HOME/vimwiki/INDEX.md'
alias c='dmconfig'
alias ff='lf'
alias nn='newsboat'
alias pp='podget'
alias rr='curseradio'
alias yt='youtube-dl -F'
alias ytv='youtube-dl -f 22'
alias ytvv='youtube-dl -f 137+140'
alias yta='youtube-dl -f 140'
alias yta3='youtube-dl -x --audio-format mp3 --prefer-ffmpeg'
alias zzz='sudo zzz'
alias df='df -h'
alias duu='ncdu -e'
alias wolopenbox="wol 00:26:2d:7c:3a:d3"
alias wololdman='wol 00:18:71:83:50:ac'

### FUNCTIONS
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
    sudo xbps-install "$(xbps-query -Rs '' | fzf -i | awk '{ print $2}')"
}

yyrr() {
    sudo xbps-remove "$(xbps-query -s '' | fzf -i | awk '{ print $2}')"
}



source ~/bin/antigen.zsh
antigen use oh-my-zsh

# plugins with oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle extract
antigen bundle fd
antigen bundle nmap
antigen bundle ripgrep
antigen bundle rsync
antigen bundle systemadmin
antigen bundle web-search
antigen bundle zsh-interactive-cd
antigen bundle z

# external plugins
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle desyncr/auto-ls
antigen bundle MichaelAquilina/zsh-you-should-use

antigen bundle zsh-users/zsh-syntax-highlighting # must be last plugin to get effect

# theme
antigen theme romkatv/powerlevel10k

antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
