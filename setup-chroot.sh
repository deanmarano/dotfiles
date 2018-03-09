# outside of chroot
# install chromebrew (crew)
curl -Ls git.io/vddgY | bash

# setup custom fonts
sudo mkdir -p /usr/local/share/fonts
sudo wget -P /usr/local/share/fonts https://rawgit.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf
mkdir -p /tmp/test/
sudo mount --bind /home/chronos/ /tmp/test/
cd /tmp/test/user
cat > .fonts.conf << FONTS
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
        <dir>/usr/local/share/fonts</dir>
</fontconfig>
FONTS


echo "sudo hostname pixelbook" >> .bashrc
echo "sudo enter-chroot" >> .bashrc

# reboot

# create chroot

# in chroot
echo "127.0.0.1 pixelbook" > /etc/hosts

sudo apt update
sudo apt install build-essential curl file git python-setuptools git tree htop openssh-server

git clone https://github.com/Linuxbrew/brew.git ~/.linuxbrew
/home/dean/.linuxbrew/bin/brew install tmux vim git fish asdf
ssh-keygen
git clone git@github.com:deanmarano/dotfiles.git
sudo locale-gen en_US.UTF-8
# 1. Add the Spotify repository signing keys to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update

# 4. Install Spotify
sudo apt-get install spotify-client
