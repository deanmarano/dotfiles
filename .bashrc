export PATH="$HOME/bin:/usr/local/heroku/bin:/usr/local/lib/node_modules:/usr/X11/bin:/usr/local/share/npm/bin:/usr/local/bin:$PATH"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

ulimit -n 4096

# Ruby
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_GC_HEAP_INIT_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000

# Java
export JBOSS_HOME=~/.immutant/current/jboss

# Docker
export DOCKER_HOST=tcp://127.0.0.1:4243

# Node
export NODE_PATH="/usr/local/lib/node/bin"

if [ -f  /System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/java_home ]; then
  export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/java_home`
fi

export HISTCONTROL=erasedups
export HISTSIZE=1000000

shopt -s histappend
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Set git autocompletion and PS1 integration
if [ -f  /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
fi

if [ -f  /usr/local/etc/bash_completion.d/R ]; then
  . /usr/local/etc/bash_completion.d/R
fi


if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
    . /usr/local/etc/bash_completion.d/git-prompt.sh
fi

# enable bash completion in interactive shells in Ubuntu
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f  /usr/local/etc/bash_completion.d/tmux ]; then
  . /usr/local/etc/bash_completion.d/tmux
fi

GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

# cli tools
alias t="tmux attach -t `hostname` || tmux new -s `hostname`"
alias g="git"
alias gprom="git pull --rebase origin master"
alias gprum="git pull --rebase upstream master"
alias gprod="git pull --rebase origin dev"
alias gaap="git add -A && git commit --amend && git push -f"
alias git-merged="git branch --merged | grep -v \"\\*\" | xargs -n 1 git branch -d"
alias git-merged-remote="git branch -a --merged remotes/origin/master | grep -v master | grep "remotes/origin/" | cut -d "/" -f 3 | xargs -n 1 git push --delete origin; git remote prune origin"

cdp() { cd ~/project/; if [ $# -eq 1 ]; then cd $1; fi };
cdpo() { cd ~/projects/; if [ $# -eq 1 ]; then cd $1; fi };
words() { vi ~/Dropbox/Documents/750Words/`date +%Y.%m.%d`.md; }

alias cd.="cd ~/dotfiles"
alias cd3="cd ~/project/three-joys-ui"
alias cdsp="cd ~/Documents/Coursera/audio-001"
alias cdvim="cd ~/.vim"
alias cdd="cd ~/Documents/"
alias gtd="git diff origin > ~/the.diff"
alias kaboom="rm -rf node_modules bower_components && npm cache clear && npm install & bower install"
alias lien="lein"
alias sync_music="rsync -vtr --size-only fusion:\"/media/zeta/My\ MP3s\" /Users/dmarano/Music/"

# atom
alias sshatom="ssh dean@atom.deanoftech.com"
alias sshfsatom="mkdir -p /Volumes/atom && sshfs dean@atom.deanoftech.com:/ /Volumes/atom/ -oauto_cache,reconnect,defer_permissions,negative_vncache,volname=atom"
alias vncatom="ssh dean@atom.deanoftech.com 'tightvncserver :1' && sleep 3 && open vnc://atom.deanoftech.com:6000"

alias clj="lein repl"
alias psgrep=" ps ax | grep"
alias web="http-server -p 8000"
alias gae="dev_appserver.py ."
if [ "$(expr $(uname -s))" == "Darwin" ]; then
  export EDITOR="/usr/local/bin/nvim"
  alias vi="/usr/local/bin/nvim"

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Do something under Linux platform
  alias open="xdg-open"
  alias docker="sudo docker"
  export EDITOR="/usr/local/bin/vim"
  export TERM=xterm-256color tmux
  export RAILS_ENV=development
  alias sagi="sudo apt-get install -y"
  alias upgrade="sudo apt-get update && sudo apt-get dist-upgrade -y"
fi

source ~/dotfiles/espark.sh

export NVM_DIR="`echo $HOME`/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
