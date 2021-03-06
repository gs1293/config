#!/bin/bash

mkdir -p ~/.config/ranger/
mkdir -p ~/.config/i3/
mkdir -p ~/.config/i3blocks/
mkdir -p ~/.config/polybar/
mkdir -p ~/.config/youtube-dl/
mkdir -p ~/.config/gtk-3.0/
mkdir -p ~/.vim/myfunctions/
mkdir -p ~/.vim/mysnippets/

echo "Switching to Home directory"

cd || exit

if [ -d "$HOME/dotfiles" ];
then
    cd dotfiles || exit
    # Check return value to see if there are incoming updates.
    if ! git diff --quiet remotes/origin/HEAD;
    then
        # add a prompt which says local repo does not match the remote repo
        # please give ans whether want to pull or not
        echo "Local repository does not match the remote repository"
        read -p "Do you want to pull remote repository? " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            echo "Pulling remote repository"
            git pull
            echo "Copying dotfiles to home directory"
            cp ~/dotfiles/.vimrc ~/.
            cp ~/dotfiles/.inputrc ~/.
            cp ~/dotfiles/.zshrc ~/.
            cp ~/dotfiles/.gitconfig ~/.
            cp ~/dotfiles/.bash_aliases ~/.
            cp ~/dotfiles/.tmux.conf ~/.
            cp ~/dotfiles/.Xresources ~/.
            cp ~/dotfiles/.config/ranger/* ~/.config/ranger/.
            cp ~/dotfiles/.config/i3/* ~/.config/i3/.
            cp ~/dotfiles/.config/i3blocks/* ~/.config/i3blocks/.
            cp ~/dotfiles/.config/polybar/* ~/.config/polybar/.
            cp ~/dotfiles/.config/youtube-dl/* ~/.config/youtube-dl/.
            cp ~/dotfiles/.config/gtk-3.0/* ~/.config/gtk-3.0/.
            cp ~/dotfiles/.vim/myfunctions/* ~/.vim/myfunctions/.
            cp ~/dotfiles/.vim/mysnippets/* ~/.vim/mysnippets/.
        fi
    else
        echo "Local repository already up to date with the remote repository"
    fi
    cd || exit
else
    echo "No old dotfiles directory exists, so"
    echo "cloning dotfiles repository from github"
    git clone https://github.com/gs1293/dotfiles.git
fi

echo "Done"
