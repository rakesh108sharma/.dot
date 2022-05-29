if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

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
