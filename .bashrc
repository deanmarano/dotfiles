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

HISTCONTROL=erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000

if [ -t 1 ]
then
  bind '"\e[A":history-search-backward'
  bind '"\e[B":history-search-forward'
fi

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

source ~/dotfiles/bash_aliases

if [ "$(expr $(uname -s))" == "Darwin" ]; then
  export EDITOR="/usr/local/bin/nvim"
  alias vi="/usr/local/bin/nvim"

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Do something under Linux platform
  source /etc/bash_completion.d/git-prompt
  source /home/dean/.linuxbrew/etc/bash_completion.d/tmux
  source /home/dean/.linuxbrew/etc/bash_completion.d/brew
  alias open="xdg-open"
  alias docker="sudo docker"
  export EDITOR="/usr/local/bin/vim"
  export TERM=xterm-256color tmux
  export RAILS_ENV=development
  alias sagi="sudo apt-get install -y"
  alias upgrade="sudo apt-get update && sudo apt-get dist-upgrade -y"
  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
fi

# Load nvm
export NVM_DIR="`echo $HOME`/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
