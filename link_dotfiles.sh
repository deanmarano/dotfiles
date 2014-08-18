mkdir -p ~/dotfile-backup
mv ~/.tmux.conf ~/dotfile-backup/.tmux.conf
mv ~/.vimrc ~/dotfile-backup/.vimrc
mv ~/.gitconfig ~/dotfile-backup/.gitconfig
mv ~/.bashrc ~/dotfile-backup/.bashrc
mv ~/.vim ~/dotfile-backup/.vim

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc

if [ "$(expr $(uname -s))" == "Darwin" ]; then
  ln -s ~/dotfiles/.gitconfig ~/.gitconfig
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  ln -s ~/dotfiles/ubuntu.gitconfig ~/.gitconfig
fi

ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.vim ~/.vim

mkdir -p ~/bin
