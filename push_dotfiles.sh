#!/bin/bash

echo "Switching to HOME directory"

cd || exit

mkdir -p ~/dotfiles
mkdir -p ~/dotfiles/.config/ranger
mkdir -p ~/dotfiles/.config/i3
mkdir -p ~/dotfiles/.config/i3blocks
mkdir -p ~/dotfiles/.config/polybar
mkdir -p ~/dotfiles/.config/youtube-dl
mkdir -p ~/dotfiles/.config/gtk-3.0
mkdir -p ~/dotfiles/.vim/myfunctions
mkdir -p ~/dotfiles/.vim/mysnippets

echo "Copying dotfiles to local repo"
cp ~/.vimrc ~/dotfiles/.
cp ~/.inputrc ~/dotfiles/.
cp ~/.zshrc ~/dotfiles/.
cp ~/.gitconfig ~/dotfiles/.
cp ~/.bash_aliases ~/dotfiles/.
cp ~/.tmux.conf ~/dotfiles/.
cp ~/.Xresources ~/dotfiles/.
cp ~/.config/ranger/rc.conf ~/dotfiles/.config/ranger/.
cp ~/.config/ranger/rifle.conf ~/dotfiles/.config/ranger/.
cp ~/.config/ranger/commands.py ~/dotfiles/.config/ranger/.
cp ~/.config/ranger/commands_full.py ~/dotfiles/.config/ranger/.
cp ~/.config/ranger/scope.sh ~/dotfiles/.config/ranger/.
cp ~/.config/ranger/bookmarks ~/dotfiles/.config/ranger/.
cp ~/.config/i3/config ~/dotfiles/.config/i3/.
cp ~/.config/i3/rofi ~/dotfiles/.config/i3/.
cp ~/.config/i3/compton.conf ~/dotfiles/.config/i3/.
cp ~/.config/i3/programs.sh ~/dotfiles/.config/i3/.
cp ~/.config/i3/pywal.sh ~/dotfiles/.config/i3/.
cp ~/.config/i3blocks/config ~/dotfiles/.config/i3blocks/.
cp ~/.config/polybar/config ~/dotfiles/.config/polybar/.
cp ~/.config/polybar/launch.sh ~/dotfiles/.config/polybar/.
cp ~/.config/youtube-dl/config ~/dotfiles/.config/youtube-dl/.
cp ~/.config/gtk-3.0/gtk.css ~/dotfiles/.config/gtk-3.0/.
cp ~/.vim/myfunctions/* ~/dotfiles/.vim/myfunctions/.
cp ~/.vim/mysnippets/* ~/dotfiles/.vim/mysnippets/.

echo "Entering dotfiles directory"
cd ~/dotfiles || exit

if [[ $(git status --porcelain) ]];
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
