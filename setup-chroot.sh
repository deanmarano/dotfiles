sudo apt update
sudo apt install build-essential curl file git python-setuptools git

git clone https://github.com/Linuxbrew/brew.git ~/.linuxbrew
/home/dean/.linuxbrew/bin/brew install tmux vim git fish asdf
ssh-keygen
git clone git@github.com:deanmarano/dotfiles.git
sudo locale-gen en_US.UTF-8
