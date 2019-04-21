#!/bin/bash

echo "Switching to Home directory"

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

mkdir ~/.config/ranger/
mkdir ~/.vim/myfunctions/
mkdir ~/.vim/mysnippets/

echo "Copying dotfiles to home directory"
cp ~/dotfiles/.vimrc ~/.
cp ~/dotfiles/.inputrc ~/.
cp ~/dotfiles/.zshrc ~/.
cp ~/dotfiles/.gitconfig ~/.
cp ~/dotfiles/.bash_aliases ~/.
cp ~/dotfiles/.config/ranger/* ~/.config/ranger/.
cp ~/dotfiles/.vim/myfunctions/* ~/.vim/myfunctions/.
cp ~/dotfiles/.vim/mysnippets/* ~/.vim/mysnippets/.

echo "Done"
