set fish_greeting ""

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
