#!/bin/bash

echo "Switching to home directory"

cd

if [ -d "$HOME/dotfiles" ];
then
    cd dotfiles
    git pull
    cd
else
    echo "Cloning dotfiles repository from github"
    git clone https://github.com/gs1293/dotfiles.git
fi

echo "Copying dotfiles to home directory"
cp ~/dotfiles/.vimrc ~/.
cp ~/dotfiles/.inputrc ~/.
cp ~/dotfiles/.zshrc ~/.
cp ~/dotfiles/.gitconfig ~/.
cp ~/dotfiles/.bash_aliases ~/.

echo "Done"
