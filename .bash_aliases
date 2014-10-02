alias hosts='sudo vi /etc/hosts'

# databases / servers
alias ngup='sudo nginx'
alias ngdown='sudo nginx -s stop'
alias pgup='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgdown='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias rdup='sudo launchctl start io.redis.redis-server'
alias rddown='sudo launchctl stop io.redis.redis-server'
alias mngup='mongod run --config /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf'
alias myup='/usr/local/Cellar/mysql/5.5.27/support-files/mysql.server start'
alias mydown='/usr/local/Cellar/mysql/5.5.27/support-files/mysql.server stop'
alias apup='sudo apachectl start'
alias apdown='sudo apachectl stop'

# Screen
alias sn='screen -aAU'

# Bash Commands
alias callme='sudo su -'
alias please=sudo
alias psack='ps aux | ack'
alias psgrep='ps aux | grep'
alias v='mvim'
alias v.='mvim .'

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

# Node commands
alias npm-exec='PATH=$(npm bin):$PATH'
alias ne='npm-exec'

[ ! -f "$HOME/.bash_aliases.local" ] || . "$HOME/.bash_aliases.local"
