mkdir -p ~/dotfile-backup/`date "+%Y-%m-%d"`
mv ~/.vimrc ~/dotfile-backup/`date "+%Y-%m-%d"`
mv ~/.vim ~/dotfile-backup/`date "+%Y-%m-%d"`
mv ~/.bashrc ~/dotfile-backup/`date "+%Y-%m-%d"`
mv ~/.gitconfig ~/dotfile-backup/`date "+%Y-%m-%d"`
mv ~/.tmux.conf ~/dotfile-backup/`date "+%Y-%m-%d"`

ln -s ~/Dropbox/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/Dropbox/dotfiles/.vimrc ~/.vimrc
ln -s ~/Dropbox/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/Dropbox/dotfiles/.bashrc ~/.bashrc
ln -s ~/Dropbox/dotfiles/.vim ~/.vim
