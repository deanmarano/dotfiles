#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export LC_ALL=en_US.UTF-8
#PATH=$PATH:node_modules/.bin # add any node binaries to path
#PATH=$PATH:$HOME/.yarn/bin
PATH=$PATH:$HOME/bin
#PATH=$PATH:/usr/local/heroku/bin
PATH=$PATH:/usr/local/lib/node_modules
PATH=$PATH:/usr/X11/bin
PATH=$PATH:/usr/local/share/npm/bin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/Cellar/postgresql@9.5/9.5.19_1/bin

ulimit -n 4096

# Ruby
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_GC_HEAP_INIT_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000

# Node
export NODE_PATH="/usr/local/lib/node/bin"

# Bash
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

if [ -f  /usr/local/etc/bash_completion.d/R ]; then
  . /usr/local/etc/bash_completion.d/R
fi

if [ -d  /home/dean/.linuxbrew/etc/bash_completion.d ]; then
  for f in /home/dean/.linuxbrew/etc/bash_completion.d/**; do
     . $f
  done
fi

# Set git autocompletion and PS1 integration
GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

source ~/dotfiles/bash_aliases

if [ "$(expr $(uname -s))" == "Darwin" ]; then
  ulimit -n 4096
  alias vi="/usr/local/bin/vim"
  export EDITOR="/usr/local/bin/vim"

  export PATH="/usr/local/sbin:$PATH"

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Do something under Linux platform

  if [ -f /etc/bash_completion.d/git-prompt ]; then
    source /etc/bash_completion.d/git-prompt
  fi
  alias open="xdg-open"
  alias docker="sudo docker"
  alias vi="/home/dean/.linuxbrew/bin/vim"
  export EDITOR="/home/dean/.linuxbrew/bin/vim"
  export TERM=xterm-256color tmux
  export RAILS_ENV=development
  alias sagi="sudo apt-get install -y"
  alias upgrade="sudo apt-get update && sudo apt-get dist-upgrade -y"
  export PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
  export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"


  if [ -f  /usr/local/bin/croutonwebsocket ]; then
    # Do chromeOS things
    export BROWSER="croutonurlhandler"
    # hack until I can figure out the clipboard
    alias xclip="croutonurlhandler"
  fi
fi

#. $HOME/.asdf/asdf.sh

#. $HOME/.asdf/completions/asdf.bash
