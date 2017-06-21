# Backup existing files if they exist
mkdir -p ~/.original-dotfiles
mv ~/.tmux.conf ~/.original-dotfiles/.tmux.conf 2> /dev/null
mv ~/.vimrc ~/.original-dotfiles/.vimrc 2> /dev/null
mv ~/.vim ~/.original-dotfiles/.vim 2> /dev/null
mv ~/.nvim ~/.original-dotfiles/.nvim 2> /dev/null
mv ~/.nvimrc ~/.original-dotfiles/.vimrc 2> /dev/null
mv ~/.gitconfig ~/.original-dotfiles/.gitconfig 2> /dev/null
mv ~/.bashrc ~/.original-dotfiles/.bashrc 2> /dev/null
mv ~/.gemrc ~/.original-dotfiles/.gemrc 2> /dev/null


# Git config is slightly different based on OS
if [ "$(expr $(uname -s))" == "Darwin" ]; then
  ln -s ~/dotfiles/.gitconfig ~/.gitconfig
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  ln -s ~/dotfiles/ubuntu.gitconfig ~/.gitconfig
fi

mkdir -p ~/.cache/swap/{backup,undo,swap}
mkdir -p ~/{bin,.config,.ssh}
mkdir -p ~/.config/fish

ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vim ~/.nvim
ln -s ~/dotfiles/vimrc ~/.nvim/init.vim
ln -s ~/dotfiles/.gemrc ~/.gemrc
ln -s ~/dotfiles/ssh.config ~/.ssh/config
ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
ln -s ~/dotfiles/.npmrc ~/.npmrc
