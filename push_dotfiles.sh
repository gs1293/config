#!/bin/bash

echo "Switching to HOME directory"

cd

if [ ! -d "$HOME/dotfiles" ];
then
    echo "Creating dotfiles directory"
    mkdir -p ~/dotfiles
fi

echo "Copying dotfiles to local repo"
cp ~/.vimrc ~/dotfiles/.
cp ~/.inputrc ~/dotfiles/.
cp ~/.zshrc ~/dotfiles/.
cp ~/.gitconfig ~/dotfiles/.
cp ~/.bash_aliases ~/dotfiles/.

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
