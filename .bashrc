bind 'set bind-tty-special-chars off'
bind '"\ep": history-search-backward'
bind '"\en": history-search-forward'
bind '"\C-w": backward-kill-word'

[ -z "$PS1" ] || stty -ixon

[ ! -f "$HOME/.bash_aliases" ] || source "$HOME/.bash_aliases"
[ ! -f "$HOME/.bash_functions" ] || source "$HOME/.bash_functions"
[ ! -f "$(brew --prefix)/etc/bash_completion" ] || source "$(brew --prefix)/etc/bash_completion"

# define the pair function
source "$HOME/.pair"
pair -q

# define the sd function
source '/Users/ryland/code/github/sd/sd'

# rbenv
eval "$(rbenv init -)"

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


[ ! -f "$HOME/.bashrc.local" ] || source "$HOME/.bashrc.local"
