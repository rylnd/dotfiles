alias hosts='sudo vi /etc/hosts'

# databases / servers
alias ngup='sudo nginx'
alias ngdown='sudo nginx -s stop'
alias pgup='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgdown='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias rdup='redis-server /usr/local/etc/redis.conf'
alias mngup='mongod run --config /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf'
alias myup='mysql.server start'
alias mydown='mysql.server stop'
alias apup='sudo apachectl start'
alias apdown='sudo apachectl stop'
alias serve='python -m SimpleHTTPServer'

# command enhancements
alias sn='screen -aAU'
alias v='mvim'
alias v.='mvim .'
alias vi='mvim -v'
alias vim='mvim -v'

# Bash Commands
alias callme='sudo su -'
alias please=sudo
alias psack='ps aux | ack'
alias psgrep='ps aux | grep'
alias notes='vim /Users/ryland/Dropbox/writing/notes'
alias mnotes='mvim /Users/ryland/Dropbox/writing/notes'
alias so='source ~/.bash_profile'

# Directory Navigation
alias ...='cd ../..;l;'
alias ..='cd ..;l;'
alias l='ls -aFG'
alias ll='l -lh'

# Git Commands
alias gd='git diff'
alias gap='git add -p'
alias gbr='git branch'
alias gcl='git clone'
alias gco='git checkout'
alias gdc='git diff --cached'
alias gdf='git diff -a -w'
alias gfa='git fetch --all'
alias gll='git pull'
alias glp='git log -p'
alias gsh='git push'
alias gst='git status'
alias gfull='clear; git status; git add .; git add -u; echo "#################"; git status; git ci -am'
alias gtrim="sed -i '' -e 's/[[:space:]]*$//g'"

# ruby commands
alias be='bundle exec'

# pair
alias unpair='pair -u'

# Node commands
alias npm-exec='PATH=$(npm bin):$PATH'
alias ne='npm-exec'

# Go commands
alias gocover='goop go test -coverprofile=cover.out ./...; goop go tool cover -html=cover.out'

# sails commands
alias smredo='ne sails-migrations db:drop; ne sails-migrations db:create; ne sails-migrations migrate'

# docker commands
alias b2d='boot2docker'
alias dcn='dcp build --no-cache'
alias dcp='docker-compose'
alias dcredo='yes | dcp rm && dcp build && dcp up'
alias dcrn='yes | dcp rm && dcn && dcp up'
alias de='DOCKER_IP=$(docker-machine ip base)'
alias dm='docker-machine'
alias dprune='docker rmi $(docker images -q --filter "dangling=true")'

# copy uuid to clipboard
alias cuuid='uuid | tr -d "\n" | pbcopy'

[ ! -f "$HOME/.bash_aliases.local" ] || . "$HOME/.bash_aliases.local"
