set fish_greeting ""
set MC_SKIN $HOME/dotfiles/mc_solarized_light.ini
set HOMEBREW_NO_ENV_HINTS 1
set EDITOR (which vim)

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

function words
  vim -c 'execute ":WikiJournal" | :Goyo'
end

function wiki
  vim -c 'execute ":WikiIndex"'
end

function links
  vim ~/Nextcloud/wiki/links/(date +%Y.%m.%d).md -c ':AutoSaveToggle'
end

function gprom
  git pull --rebase origin main
end

function gprot
  git pull --rebase origin trunk
end

function gprod
  git pull --rebase origin develop
end

function ...
  ../..
end

function ud
  pushd .
  cd ..
  popd
end

function pbedit
  pbpaste | vipe | pbcopy
end

function public-ip
  curl icanhazip.com
end

function my-ip
  ifconfig | grep "inet " | grep -i mask | grep -v 127.0.0.1 | perl -pe 's/^\s+//' | cut -d ' ' -f2 | sed 's/addr://'
end

# https://github.com/gsamokovarov/.files/blob/master/.config/fish/aliases.fish
abbr -a be bundle exec
abbr mkdir "mkdir -p"

abbr cdd "cd ~/dotfiles"
abbr cdg "cd ~/github"
abbr cddm "cd ~/github/deanmarano/"
abbr cdra "cd ~/github/deanmarano/recipes-api"
abbr cdru "cd ~/github/deanmarano/recipes-ui"

abbr -a vi vim
abbr -a bb "cd ~/dotfiles; and brew bundle; and cd -;"

abbr kaboom "rm -rf node_modules tmp dist; and npm install"

# http://transit.iut2.upmf-grenoble.fr/doc/kitty/html/kittens/icat.html
alias icat="kitty +kitten icat"
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

# Auto-install asdf from source
if test -e ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
else
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
  source ~/.asdf/asdf.fish
end
