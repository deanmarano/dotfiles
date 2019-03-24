sudo hostname pixelbook
echo "pixelbook" | sudo tee /etc/hostnameo
git clone https://github.com/deanmarano/dotfiles.git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
sudo apt install build-essential htop
brew install tmux vim asdf fish
