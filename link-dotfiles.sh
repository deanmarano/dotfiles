# Backup existing files if they exist
mkdir -p /tmp/original-dotfiles
mv ~/.tmux.conf /tmp/original-dotfiles/.tmux.conf 2> /dev/null
mv ~/.vimrc /tmp/original-dotfiles/.vimrc 2> /dev/null
mv ~/.vim /tmp/original-dotfiles/.vim 2> /dev/null
mv ~/.gitconfig /tmp/original-dotfiles/.gitconfig 2> /dev/null
mv ~/.bashrc /tmp/original-dotfiles/.bashrc 2> /dev/null
mv ~/.gemrc /tmp/original-dotfiles/.gemrc 2> /dev/null

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global

mkdir -p ~/.cache/swap/{backup,undo,swap}
mkdir -p ~/{bin,.config,.ssh}

ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/ssh.config ~/.ssh/config
ln -s ~/dotfiles/tool-versions ~/.tool-versions
ln -s ~/dotfiles/.gemrc ~/.gemrc
ln -s ~/dotfiles/.npmrc ~/.npmrc

# Vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim

# Fish
mkdir -p ~/.config/fish
mkdir -p ~/.config/fish/functions
ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/fishfile ~/.config/fish/fishfile
ln -s ~/dotfiles/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish

# Kitty
mkdir -p ~/.config/kitty
ln -s ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf

ln -s ~/dotfiles/.asdfrc ~/.asdfrc
