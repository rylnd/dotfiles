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
alias repow='powify server stop && powify server start'
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
alias ::::::='cd ../../../../../..;l;'
alias :::::='cd ../../../../..;l;'
alias ::::='cd ../../../..;l;'
alias :::='cd ../../..;l;'
alias ::='cd ../..;l;'
alias l='ls -aFG'
alias ll='l -lh'

# Git Commands
alias gbr='git branch'
alias gcl='git clone'
alias gco='git checkout'
alias gdel='git add -u'
alias gdf='clear; git diff -a -w'
alias gfa='git fetch --all'
alias gfull='clear; git status; git add .; git add -u; echo "****************"; git status; git ci -am'
alias gf='git flow'
alias glog='clear; git log'
alias glp='git log -p'
alias gme='git merge'
alias gmv='git mv'
alias gpull='git pull'
alias gpush='git push'
alias grm='git rm'
alias gst='git status'
alias gtrim="sed -i '' -e 's/[[:space:]]*$//g'"
alias gstack="gadd; gdel; git status; git redo;"
alias gjam="git push -f"
alias gitshipit="git add -A .; git commit -m 'SHIP IT'; git push -f"
alias gd='git diff'
alias gdc='git diff --cached'
alias gap='git add -p'
alias gl='git pull'
alias gp='git push'

# Gem Commands
alias audit='gem list'
alias buy='gem install'
alias polish='gem update'
alias price='gem list -r'
alias recut='gem edit -e mvim'
alias sell='gem uninstall'
alias shop='gem search -r'
alias surplus='gem list | ack ","'

# Rails 2.3
alias cr='c; yn rake'
alias deploy='cap_deploy.sh'
alias rakedbtestkill='RAILS_ENV=test rake db:drop && RAILS_ENV=test rake db:create && rake db:test:prepare'
alias rb='ruby'
alias testenv='RAILS_ENV=test'

# pair
alias unpair='pair -u'

# Bundle Commands
alias be='bundle exec'
alias becr='c; yn bundle exec rake'
alias becree='c; yn_ree bundle exec rake'
alias berake='bundle exec rake'
alias bo='bundle open'
alias mbo='BUNDLER_EDITOR=mvim bundle open'

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
