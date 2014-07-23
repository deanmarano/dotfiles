mkdir -p ~/dotfile-backup
mv ~/.tmux.conf ~/dotfile-backup/.tmux.conf
mv ~/.vimrc ~/dotfile-backup/.vimrc
mv ~/.gitconfig ~/dotfile-backup/.gitconfig
mv ~/.bashrc ~/dotfile-backup/.bashrc
mv ~/.vim ~/dotfile-backup/.vim

ln -s ~/.tmux.conf ~/Dropbox/new-dotfiles
ln -s ~/.vimrc ~/Dropbox/new-dotfiles
ln -s ~/.gitconfig ~/Dropbox/new-dotfiles
ln -s ~/.bashrc ~/Dropbox/new-dotfiles
ln -s ~/.vim ~/Dropbox/new-dotfiles

mkdir -p ~/bin
ln -s ~/Dropbox\ \(Personal\)/dotfiles/gpush.sh ~/bin/gpush.sh
