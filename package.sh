#!/bin/bash

################################################################################
#                                                       __                     #
#       ____   ___  _      __       _____ __  __ _____ / /_ ___   ____ ___     #
#      / __ \ / _ \| | /| / /      / ___// / / // ___// __// _ \ / __ `__ \    #
#     / / / //  __/| |/ |/ /      (__  )/ /_/ /(__  )/ /_ /  __// / / / / /    #
#    /_/ /_/ \___/ |__/|__/______/____/ \__, //____/ \__/ \___//_/ /_/ /_/     #
#                         /_____/      /____/                                  #
#                                                                              #
################################################################################

#{{{ APT PACKAGE LIST
apt_package_list="               \
    texlive-latex-extra          \
    texlive-extra-utils          \
    openssh-client               \
    openssh-server               \
    net-tools                    \
    python3-pip                  \
    cmatrix                      \
    w3m                          \
    w3m-img                      \
    ffmpegthumbnailer            \
    gnome-tweak-tool             \
    screen                       \
    ncdu                         \
    shellcheck                   \
    blueman                      \
    i3blocks                     \
    compton                      \
    mplayer                      \
    xbacklight                   \
    pavucontrol                  \
    i3lock-fancy                 \
    verilator                    \
    iverilog                     \
    lolcat                       \
    figlet                       \
    toilet                       \
    tty-clock                    \
    meld                         \
    thunar                       \
    konsole                      \
    mps-youtube                  \
    cowsay                       \
    lxappearance                 \
    lynx                         \
    surfraw                      \
    rxvt-unicode                 \
    xsel                         \
    playerctl                    \
    tree                         \
    git                          \
    kompare kdiff3               \
    mpv smplayer                 \
    curl                         \
    chromium-browser qutebrowser \
    zathura                      \
    mupdf mupdf-tools            \
    qbittorrent                  \
    shutter                      \
    htop                         \
    xterm                        \
    feh                          \
    wallch                       \
    zsh                          \
    rofi                         \
    cmus                         \
    tmux                         \
    gimp                         \
    neofetch                     \
    xattr                        \
    i3                           \
    snapd                        \
    uget                         \
    aria2                        \
    python-pip                   \
    vlc                          \
    vim                          \
    vim-gtk3                     \
    ranger vifm                  \
    highlight                    \
    atool                        \
    libarchive-tools             \
    elinks                       \
    transmission-cli             \
    libimage-exiftool-perl       \
    odt2txt                      \
    openjdk-11-jre               \
    "
#}}}

#{{{ SNAP CLASSIC PACKAGE LIST
snap_classic_package_list=" \
    code                    \
    sublime-text            \
    atom                    \
    cool-retro-term         \
    "
#}}}

#{{{ SNAP STRICT PACKAGE LIST
snap_strict_package_list=" \
    gitkraken              \
    gotop-cjbassi          \
    "
#}}}

################################################################################

#{{{
echo "Switching to home directory"
cd || exit

echo "Updating system"
sudo apt-get update -y > /dev/null

echo "Upgrading system"
sudo apt-get upgrade -y > /dev/null

echo "Cleaning system"
sudo apt-get autoremove -y > /dev/null
sudo apt-get autoclean -y > /dev/null
sudo apt-get clean -y > /dev/null
#}}}

################################################################################

#{{{
echo "Installing packages from Ubuntu Repositories"

for apt_package in $apt_package_list
do
    if dpkg -s "$apt_package" &> /dev/null
    then
        printf "\t\t%s\n" "✓✓ $apt_package"
    else
        sudo apt-get install "$apt_package" -y
    fi
done

echo "Installing poweline fonts for zsh themes"
sudo apt-get install fonts-powerline -y > /dev/null

echo "Setting dash to dock click action to minimize"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
#}}}

################################################################################

#{{{
echo "Updating snap packages"
sudo snap refresh

echo "Installing packages from the snap store"

for snap_classic_package in $snap_classic_package_list
do
    if snap list | awk 'NR>=2 {print $1}' | grep -x "$snap_classic_package" &> /dev/null
    then
        printf "\t\t%s\n" "✓✓ $snap_classic_package"
    else
        sudo snap install "$snap_classic_package" --classic
    fi
done

for snap_strict_package in $snap_strict_package_list
do
    if snap list | awk 'NR>=2 {print $1}' | grep -x "$snap_strict_package" &> /dev/null
    then
        printf "\t\t%s\n" "✓✓ $snap_strict_package"
    else
        sudo snap install "$snap_strict_package"
    fi
done
#}}}

    # npm \
################################################################################
