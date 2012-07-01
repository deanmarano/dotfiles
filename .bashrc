if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi 
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export NO_SSH=true
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1

export RUBY_GC_MALLOC_LIMIT=50000000
export EDITOR="/usr/local/bin/vim"
export PATH="$HOME/bin:~/groupon/groupon-bin:/usr/local/lib/node_modules:/usr/local/bin:$PATH"

# Set git autocompletion and PS1 integration
if [ -f  /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
fi
GIT_PS1_SHOWDIRTYSTATE=true

PS1='\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
alias sshatom="ssh dean@atom.deanoftech.com"
alias ssh374="ssh dmarano1@ctilinux1.cstcis.cti.depaul.edu"
alias g="git"
alias gtd="git diff origin > ~/the.diff"
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
alias prepare_tests="rake db:migrate:local"
alias belt="mkdir -p config/local && cp config/feature_set.yml config/local/feature_set.yml"
alias suspenders="rake assets:all:rebuild"
alias bundleup="bundle install && bundle exec cap update_local"
alias gitready="git pull --rebase && git prune && git remote prune origin"
alias boosh="gitready && bundleup && belt && suspenders && prepare_tests"
alias branch="git branch 2>/dev/null|grep -e ^* | tr -d \ *\/"
alias bprm="build push rebase master $1"
alias be="bundle exec"
alias bec="bundle exec cucumber --format pretty -color $1"
alias vncatom="ssh dean@atom.deanoftech.com 'tightvncserver :1' && sleep 3 && open vnc://atom.deanoftech.com:6000"
