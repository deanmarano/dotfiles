set fish_greeting ""

fundle plugin 'edc/bass'
fundle init

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
