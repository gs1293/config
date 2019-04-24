#!/bin/bash

echo "Switching to HOME directory"

cd

mkdir -p ~/dotfiles
mkdir -p ~/dotfiles/.config/ranger
mkdir -p ~/dotfiles/.config/i3
mkdir -p ~/dotfiles/.vim/myfunctions
mkdir -p ~/dotfiles/.vim/mysnippets

echo "Copying dotfiles to local repo"
cp ~/.vimrc ~/dotfiles/.
cp ~/.inputrc ~/dotfiles/.
cp ~/.zshrc ~/dotfiles/.
cp ~/.gitconfig ~/dotfiles/.
cp ~/.bash_aliases ~/dotfiles/.
cp ~/.config/ranger/rc.conf ~/dotfiles/.config/ranger/.
cp ~/.config/ranger/rifle.conf ~/dotfiles/.config/ranger/.
cp ~/.config/ranger/commands.py ~/dotfiles/.config/ranger/.
cp ~/.config/ranger/commands_full.py ~/dotfiles/.config/ranger/.
cp ~/.config/ranger/scope.sh ~/dotfiles/.config/ranger/.
cp ~/.config/i3/config ~/dotfiles/.config/i3/.
cp ~/.vim/myfunctions/* ~/dotfiles/.vim/myfunctions/.
cp ~/.vim/mysnippets/* ~/dotfiles/.vim/mysnippets/.

echo "Entering dotfiles directory"
cd ~/dotfiles

if [[ `git status --porcelain` ]];
then
    echo "New changes are present"
    echo "Staging all changes"
    git add .
    echo "Committing changes"
    git commit -m "Updating config files"
    echo "Pushing changes to remote"
    git push
else
    echo "No new changes are present"
fi

echo "Done"
