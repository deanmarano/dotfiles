# Ruby
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000

# Node
export NODE_PATH="/usr/local/lib/node"

export EDITOR="/usr/local/bin/vim"
export PATH="$HOME/bin:~/groupon/groupon-bin:/usr/local/lib/node_modules:/usr/local/bin:/usr/local/sbin:./bin:/usr/local/share/npm/bin:/usr/local/share/python:$PATH"

if [ -f  /System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/java_home ]; then
  export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/java_home`
fi

export HISTCONTROL=erasedups
export HISTSIZE=10000

export NO_SSH=true

# Set git autocompletion and PS1 integration
if [ -f  /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
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



shopt -s histappend
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# groupon
alias be="bundle exec"
alias bec="bundle exec cucumber --format pretty -color $1"
alias bprm="build push rebase master $1"
alias groupon-uat-deploy="bundle exec cap uat web deploy"

# deal estate
alias prod-pending="cap production deploy:pending"
alias sshprodweb="ssh dealestate_deploy@dealestate-app1.snc1"
alias sshstagingweb="ssh dealestate_deploy@dealestate-app1-uat.snc1"
alias sshproddb="ssh dealestate_deploy@dealestate-db1.snc1"

# cli tools
alias t="tmux attach -t dealestate || tmux new -s dealestate"
alias g="git"
alias gtd="git diff origin > ~/the.diff"

# atom
alias upgrade="sudo apt-get update && sudo apt-get dist-upgrade"
alias sshatom="ssh dean@atom.deanoftech.com"
alias sshfsatom="mkdir -p /Volumes/atom && sshfs dean@atom.deanoftech.com:/ /Volumes/atom/ -oauto_cache,reconnect,defer_permissions,negative_vncache,volname=atom"
alias vncatom="ssh dean@atom.deanoftech.com 'tightvncserver :1' && sleep 3 && open vnc://atom.deanoftech.com:6000"
