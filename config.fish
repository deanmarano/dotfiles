set fish_greeting ""
set MC_SKIN $HOME/.mc/solarized.ini

alias vi="vim"

function cddm
  cd ~/github/deanmarano/
end

function free-space
  sudo apt-get autoremove
  brew cleanup
  rm -rf ~/Downloads/tmp/*
  rm -rf /tmp/*
  rvm cleanup all
  npm cache clear
  yarn cache clean
end

function localnet
  nmap -sn 192.168.1.0/24 -oG - | awk '/Up$/{print $2}'
end

function nvm
  fnm $argv
end

function words
  vim ~/Dropbox/writing/journal/(date +%Y.%m.%d).md -c ':AutoSaveToggle'
end

function links
  vim ~/Dropbox/Documents/links/(date +%Y.%m.%d).md -c ':AutoSaveToggle'
end

function gprom
  git pull --rebase origin master
end
