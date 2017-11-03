mkdir -p ~/.original-dotfiles
mv ~/.tmux.conf ~/.original-dotfiles/.tmux.conf 2> /dev/null
mv ~/.vimrc ~/.original-dotfiles/.vimrc 2> /dev/null
mv ~/.vim ~/.original-dotfiles/.vim 2> /dev/null
mv ~/.nvim ~/.original-dotfiles/.nvim 2> /dev/null
mv ~/.nvimrc ~/.original-dotfiles/.vimrc 2> /dev/null
mv ~/.gitconfig ~/.original-dotfiles/.gitconfig 2> /dev/null
mv ~/.bashrc ~/.original-dotfiles/.bashrc 2> /dev/null
mv ~/.gemrc ~/.original-dotfiles/.gemrc 2> /dev/null


if [ "$(expr $(uname -s))" == "Darwin" ]; then
  ln -s ~/dotfiles/.gitconfig ~/.gitconfig
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  ln -s ~/dotfiles/ubuntu.gitconfig ~/.gitconfig
fi

mkdir -p ~/.config
mkdir -p ~/.cache/vim/{backup,swap,undo}
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vimrc ~/.nvimrc
ln -s ~/dotfiles/.vim ~/.nvim
ln -s ~/dotfiles/.vimrc ~/nvim/init.vim
ln -s ~/dotfiles/.gemrc ~/.gemrc

mkdir -p ~/bin
