#!/bin/bash

package_list=" \
    texlive-latex-extra \
    texlive-extra-utils \
    openssh-client \
    openssh-server \
    net-tools \
    python3-pip \
    cmatrix \
    w3m \
    w3m-img \
    ffmpegthumbnailer \
    gnome-tweak-tool \
    screen \
    ncdu \
    shellcheck \
    blueman \
    i3blocks \
    compton \
    mplayer \
    xbacklight \
    pavucontrol \
    i3lock-fancy \
    verilator \
    iverilog \
    lolcat \
    figlet \
    toilet \
    tty-clock \
    meld \
    thunar \
    konsole \
    mps-youtube \
    cowsay \
    lxappearance \
    lynx \
    surfraw \
    rxvt-unicode \
    xsel \
    playerctl
    tree \
    git \
    kompare \
    "

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

for package in $package_list
do
    if dpkg -s "$package" &> /dev/null
    then
        echo "$package is already installed!"
    else
        sudo apt-get install "$package" -y
    fi
done

#############################################################

    # npm \

#############################################################
