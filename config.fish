set fish_greeting ""

fundle plugin 'edc/bass'
fundle init

alias vi="vim"

function cddm
  cd ~/github/deanmarano/
end

function free-space
  sudo apt-get autoremove
  brew cleanup
  rm -rf ~/Downloads/tmp/*
  rm -rf /tmp/*
end

function localnet
  nmap -sn 192.168.1.0/24 -oG - | awk '/Up$/{print $2}'
end

function nvm
  bass source ~/.linuxbrew/opt/nvm/nvm.sh --no-use ';' nvm $argv
end

function words
  vim ~/Dropbox/Documents/journal/(date +%Y.%m.%d).md -c ':AutoSaveToggle'
end

function links
  vim ~/Dropbox/Documents/links/(date +%Y.%m.%d).md -c ':AutoSaveToggle'
end
