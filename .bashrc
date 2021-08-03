# If not running interactively, don't do anything
[ -z "$PS1" ] && return

bind 'set bind-tty-special-chars off'
bind '"\ep": history-search-backward'
bind '"\en": history-search-forward'
bind '"\C-w": backward-kill-word'
stty -ixon

[ ! -f "$HOME/.bash_env" ] || source "$HOME/.bash_env"
[ ! -f "$HOME/.bash_env.local" ] || source "$HOME/.bash_env.local"

[ ! -f "$HOME/.bash_aliases" ] || source "$HOME/.bash_aliases"
[ ! -f "$HOME/.bash_functions" ] || source "$HOME/.bash_functions"
[ ! -f "$(brew --prefix)/etc/profile.d/bash_completion.sh" ] || source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
[ ! -f "$HOME/.iterm2_shell_integration.bash" ] || source "$HOME/.iterm2_shell_integration.bash"

# define the sd function
source '/Users/ryland/code/github/sd/sd'

# rbenv
eval "$(rbenv init -)"

# nvm
export NVM_DIR=~/.nvm
source "/usr/local/opt/nvm/nvm.sh"
