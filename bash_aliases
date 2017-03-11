# cli tools
alias t="tmux attach -t `hostname` || tmux new -s `hostname`"
alias gprom="git pull --rebase origin master"
alias gprum="git pull --rebase upstream master"
alias gprod="git pull --rebase origin dev"
alias git-merged="git branch --merged | grep -v \"\\*\" | xargs -n 1 git branch -d"
alias git-merged-remote="git branch -a --merged remotes/origin/master | grep -v master | grep "remotes/origin/" | cut -d "/" -f 3 | xargs -n 1 git push --delete origin; git remote prune origin"
alias localnet="nmap -sn 192.168.1.0/24 -oG - | awk '/Up$/{print $2}'"

cdp() { cd ~/project/; if [ $# -eq 1 ]; then cd $1; fi };
cddm() { cd ~/github/deanmarano/; if [ $# -eq 1 ]; then cd $1; fi };
cdg() { cd ~/github/; if [ $# -eq 1 ]; then cd $1; fi };
alias words="vi ~/Dropbox/writing/journal/`date +%Y.%m.%d`.md -c ':AutoSaveToggle'"
alias links="vi ~/Dropbox/Documents/links/`date +%Y.%m.%d`.md -c ':AutoSaveToggle'"

alias du="du -h --max-depth=1 ."
alias dd="dcfldd"
alias cd.="cd ~/dotfiles"
alias cdvim="cd ~/.vim"
alias cdd="cd ~/Documents/"
alias kaboom="rm -rf node_modules bower_components && npm cache clear && npm install & bower install"
alias lien="lein"
alias sync_music="rsync -vtr --size-only fusion:\"/mnt/eta/My\ MP3s\" ~/Music/"

alias clj="lein repl"
alias psgrep=" ps ax | grep"
alias web="http-server -p 8000"
alias gae="dev_appserver.py ."
