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
cddm() { cd ~/github/deanmarano/; if [ $# -eq 1 ]; then cd $1; fi };
cdg() { cd ~/github/; if [ $# -eq 1 ]; then cd $1; fi };
words() { vi ~/Dropbox/Documents/750Words/`date +%Y.%m.%d`.md; }

alias cd.="cd ~/dotfiles"
alias cd3="cd ~/project/three-joys-ui"
alias cdk="cd ~/github/deanmarano/karmako"
alias cdsp="cd ~/Documents/Coursera/audio-001"
alias cdvim="cd ~/.vim"
alias cdd="cd ~/Documents/"
alias gtd="git diff origin > ~/the.diff"
alias kaboom="rm -rf node_modules bower_components && npm cache clear && npm install & bower install"
alias lien="lein"
alias sync_music="rsync -vtr --size-only fusion:\"/mnt/eta/My\ MP3s\" ~/Music/"

# atom
alias sshatom="ssh dean@atom.deanoftech.com"
alias sshfsatom="mkdir -p /Volumes/atom && sshfs dean@atom.deanoftech.com:/ /Volumes/atom/ -oauto_cache,reconnect,defer_permissions,negative_vncache,volname=atom"
alias vncatom="ssh dean@atom.deanoftech.com 'tightvncserver :1' && sleep 3 && open vnc://atom.deanoftech.com:6000"

alias clj="lein repl"
alias psgrep=" ps ax | grep"
alias web="http-server -p 8000"
alias gae="dev_appserver.py ."
