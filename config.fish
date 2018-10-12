set fish_greeting ""
set MC_SKIN $HOME/.mc/solarized.ini

if test asdf
  source (brew --cellar asdf)/(brew --cellar asdf | xargs ls | head -n 1)/asdf.fish
end

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

function ...
  ../..
end

function public-ip
  curl icanhazip.com
end

function ip
  ifconfig | grep "inet " | grep -i mask | grep -v 127.0.0.1 | perl -pe 's/^\s+//' | cut -d ' ' -f2 | sed 's/addr://'
end

# https://github.com/gsamokovarov/.files/blob/master/.config/fish/aliases.fish
abbr -a be bundle exec
abbr mkdir "mkdir -p"
abbr -a vi vim
abbr -a migrate bin/rake db:migrate

status --is-interactive; and source (rbenv init -|psub)

# https://github.com/fish-shell/fish-shell/issues/1363
function nohist
    set -l prefix $HOME/.config
    set -l path fish/fish_history

    if set -q XDG_CONFIG_HOME
        set prefix $XDG_CONFIG_HOME
    end

    if test -f $prefix/$path.copy
        mv $prefix/$path.copy $prefix/$path
    else
        cp -f $prefix/$path $prefix/$path.copy
        echo y | history --clear > /dev/null
    end
end
