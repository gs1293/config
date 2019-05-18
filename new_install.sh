#!/bin/bash

#############################################################

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ];
then
    echo "Installing Vundle.vim"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "Vundle.vim is already installed"
fi

if [ ! -d "$ZSH" ];
then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "oh-my-zsh is already installed"
fi

if [ ! -x "$(command -v grub-customizer)" ];
then
    echo "Installing grub-customizer"
    sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
    sudo apt-get update -y
    sudo apt-get install grub-customizer -y
else
    echo "grub-customizer is already installed"
fi

if [ ! -x "$(command -v fzf)" ];
then
    echo "Installing fzf"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
else
    echo "fzf is already installed"
fi

snap connect gotop-cjbassi:hardware-observe
snap connect gotop-cjbassi:mount-observe
snap connect gotop-cjbassi:system-observe
