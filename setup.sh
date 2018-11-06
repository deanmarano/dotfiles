# add user
# sudo adduser dean --disable-password --gecos ""
# give sudo permissions
# sudo adduser dean sudo

# install deps
sudo apt-get update
# sudo apt-get install -y git vim tmux fish build-essential autoconf python man-db coreutils libncurses5-dev

# setup ssh login
# sudo su dean
cd
mkdir .ssh
curl -o ~/.ssh/authorized_keys https://github.com/deanmarano.keys
ssh-keyscan github.com >> ~/.ssh/known_hosts
git clone https://github.com/deanmarano/dotfiles.git
dotfiles/link_dotfiles.sh
mkdir -p ~/.cache/vim/{backup,swap,undo}

# setup vim/vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Setup fish/fisherman
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

# Setup tmux/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
