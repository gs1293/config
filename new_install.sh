#!/bin/bash

#############################################################

echo "Switching to home directory"
cd || exit

echo "Updating system"
sudo apt-get update -y > /dev/null

echo "Upgrading system"
sudo apt-get upgrade -y > /dev/null

echo "Cleaning system"
sudo apt-get autoremove -y > /dev/null
sudo apt-get autoclean -y > /dev/null

#############################################################

echo "Installing packages from Ubuntu Repositories"

if [ ! -x "$(command -v vlc)" ];
then
    echo "Installing VLC Media Player"
    sudo apt-get install vlc -y
else
    echo "VLC is already installed"
fi

if [ ! -x "$(command -v vim)" ];
then
    echo "Installing Vim TUI and GUI"
    sudo apt-get install vim -y
    sudo apt-get install vim-gtk3 -y
else
    echo "Vim is already installed"
fi

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ];
then
    echo "Installing Vundle.vim"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "Vundle.vim is already installed"
fi

if [ ! -x "$(command -v wallch)" ];
then
    echo "Installing wallch"
    sudo apt-get install wallch -y
else
    echo "Wallch is already installed"
fi

if [ ! -x "$(command -v pip)" ];
then
    echo "Installing python-pip"
    sudo apt-get install python-pip -y
else
    echo "python-pip is already installed"
fi

if [ ! -x "$(command -v kdiff3)" ];
then
    echo "Installing kdiff3"
    sudo apt-get install kdiff3 -y
else
    echo "kdiff3 is already installed"
fi

if [ ! -x "$(command -v ranger)" ];
then
    echo "Installing ranger"
    sudo apt-get install ranger -y
else
    echo "ranger is already installed"
fi

if [ ! -x "$(command -v vifm)" ];
then
    echo "Installing vifm"
    sudo apt-get install vifm -y
else
    echo "vifm is already installed"
fi

if [ ! -x "$(command -v mpv)" ];
then
    echo "Installing mpv"
    sudo apt-get install mpv -y
else
    echo "mpv is already installed"
fi

if [ ! -x "$(command -v smplayer)" ];
then
    echo "Installing smplayer"
    sudo apt-get install smplayer -y
else
    echo "smplayer is already installed"
fi

if [ ! -x "$(command -v curl)" ];
then
    echo "Installing curl"
    sudo apt-get install curl -y
else
    echo "curl is already installed"
fi

if [ ! -x "$(command -v chromium-browser)" ];
then
    echo "Installing chromium-browser"
    sudo apt-get install chromium-browser -y
else
    echo "chromium-browser is already installed"
fi

if [ ! -x "$(command -v qutebrowser)" ];
then
    echo "Installing qutebrowser"
    sudo apt-get install qutebrowser -y
else
    echo "qutebrowser is already installed"
fi

if [ ! -x "$(command -v zathura)" ];
then
    echo "Installing zathura"
    sudo apt-get install zathura -y
else
    echo "zathura is already installed"
fi

if [ ! -x "$(command -v qbittorrent)" ];
then
    echo "Installing qbittorrent"
    sudo apt-get install qbittorrent -y
else
    echo "qbittorrent is already installed"
fi

if [ ! -x "$(command -v shutter)" ];
then
    echo "Installing shutter"
    sudo apt-get install shutter -y
else
    echo "shutter is already installed"
fi

if [ ! -x "$(command -v htop)" ];
then
    echo "Installing htop"
    sudo apt-get install htop -y
else
    echo "htop is already installed"
fi

if [ ! -x "$(command -v xterm)" ];
then
    echo "Installing xterm terminal"
    sudo apt-get install xterm -y
else
    echo "xterm is already installed"
fi

if [ ! -x "$(command -v feh)" ];
then
    echo "Installing feh image viewer"
    sudo apt-get install feh -y
else
    echo "feh is already installed"
fi

if [ ! -x "$(command -v uget-gtk)" ];
then
    echo "Installing uget downloader"
    sudo apt-get install uget -y
else
    echo "uget is already installed"
fi

if [ ! -x "$(command -v aria2c)" ];
then
    echo "Installing aria2 for uget"
    sudo apt-get install aria2 -y
else
    echo "aria2 is already installed"
fi

if [ ! -x "$(command -v zsh)" ];
then
    echo "Installing zsh shell"
    sudo apt-get install zsh -y
else
    echo "zsh is already installed"
fi

if [ ! -d "$ZSH" ];
then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "oh-my-zsh is already installed"
fi

echo "Installing poweline fonts for zsh themes"
sudo apt-get install fonts-powerline -y > /dev/null

if [ ! -x "$(command -v youtube-dl)" ];
then
    echo "Installing youtube-dl"
    sudo -H pip install --upgrade youtube-dl
else
    echo "youtube-dl is already installed"
fi

echo "Setting dash to dock click action to minimize"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

if [ ! -x "$(command -v grub-customizer)" ];
then
    echo "Installing grub-customizer"
    sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
    sudo apt-get update -y
    sudo apt-get install grub-customizer -y
else
    echo "grub-customizer is already installed"
fi

if [ ! -x "$(command -v rofi)" ];
then
    echo "Installing rofi"
    sudo apt-get install rofi -y
else
    echo "rofi is already installed"
fi

if [ ! -x "$(command -v cmus)" ];
then
    echo "Installing cmus"
    sudo apt-get install cmus -y
else
    echo "cmus is already installed"
fi

if [ ! -x "$(command -v tmux)" ];
then
    echo "Installing tmux"
    sudo apt-get install tmux -y
else
    echo "tmux is already installed"
fi

if [ ! -x "$(command -v fzf)" ];
then
    echo "Installing fzf"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
else
    echo "fzf is already installed"
fi

if [ ! -x "$(command -v gimp)" ];
then
    echo "Installing gimp"
    sudo apt-get install gimp -y
else
    echo "gimp is already installed"
fi


if [ ! -x "$(command -v neofetch)" ];
then
    echo "Installing gimp"
    sudo apt-get install neofetch -y
else
    echo "neofetch is already installed"
fi

if [ ! -x "$(command -v xattr)" ];
then
    echo "Installing xattr"
    sudo apt-get install xattr -y
else
    echo "xattr is already installed"
fi

if [ ! -x "$(command -v i3)" ];
then
    echo "Installing i3"
    sudo apt-get install i3 -y
else
    echo "i3 is already installed"
fi

if [ ! -x "$(command -v snap)" ];
then
    echo "Installing snap"
    sudo apt-get install snapd -y
else
    echo "snapd is already installed"
fi

#############################################################

echo "Installing packages from the snap store"

echo "Updating snap packages"
sudo snap refresh

if [ ! -x "$(command -v code)" ];
then
    echo "Installing code"
    sudo snap install code --classic
else
    echo "code is already installed"
fi

if [ ! -x "$(command -v subl)" ];
then
    echo "Installing subl"
    sudo snap install sublime-text --classic
else
    echo "subl is already installed"
fi

if [ ! -x "$(command -v atom)" ];
then
    echo "Installing atom"
    sudo snap install atom --classic
else
    echo "atom is already installed"
fi

if [ ! -x "$(command -v gitkraken)" ];
then
    echo "Installing gitkraken"
    sudo snap install gitkraken
else
    echo "gitkraken is already installed"
fi

if [ ! -x "$(command -v gotop-cjbassi)" ];
then
    echo "Installing gotop-cjbassi"
    sudo snap install gotop-cjbassi
    snap connect gotop-cjbassi:hardware-observe
    snap connect gotop-cjbassi:mount-observe
    snap connect gotop-cjbassi:system-observe
else
    echo "gotop-cjbassi is already installed"
fi

#############################################################
