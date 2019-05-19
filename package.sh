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
    chrome-gnome-shell           \
    nodejs                       \
    npm                          \
    python-gtk2                  \
    python-setuptools            \
    python-distutils-extra       \
    slop                         \
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
    jq                     \
    "
#}}}

#{{{ PIP PACKAGE LIST
pip_package_list=" \
    ranger-fm      \
    "
#}}}

#{{{ PIP3 PACKAGE LIST
pip3_package_list=" \
    asciinema       \
    pywal           \
    mps-youtube     \
    youtube-dl      \
    "
#}}}

#{{{ NPM PACKAGE LIST
npm_package_list=" \
    webtorrent-cli \
    tldr           \
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

################################################################################

#{{{
echo "Installing pip packages"

for pip_package in $pip_package_list
do
    if pip list 2> /dev/null | awk '{print $1}' | grep -x "$pip_package" &> /dev/null
    then
        printf "\t\t%s\n" "✓✓ $pip_package"
    else
        pip install "$pip_package"
    fi
done
#}}}

################################################################################

#{{{
echo "Installing pip3 packages"

for pip3_package in $pip3_package_list
do
    if pip3 list 2> /dev/null | awk '{print $1}' | grep -x "$pip3_package" &> /dev/null
    then
        printf "\t\t%s\n" "✓✓ $pip3_package"
    else
        sudo -H pip3 install "$pip3_package"
    fi
done
#}}}

################################################################################

#{{{
echo "Installing npm packages"

for npm_package in $npm_package_list
do
    if npm list -g --depth 0 | awk 'NR>=2 {print $2}' | awk -F "@" '{print $1}' | grep -x "$npm_package" &> /dev/null
    then
        printf "\t\t%s\n" "✓✓ $npm_package"
    else
        sudo npm install -g "$npm_package"
    fi
done
#}}}

################################################################################

#{{{
echo "Installing Google Chrome Browser"

if dpkg -s google-chrome-stable &> /dev/null
then
    printf "\t\t%s\n" "✓✓ google-chrome-stable"
else
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    rm google-chrome-stable_current_amd64.deb
fi

echo "Installing Brave Browser"

if dpkg -s brave-browser &> /dev/null
then
    printf "\t\t%s\n" "✓✓ brave-browser"
else
    curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
    source /etc/os-release
    echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list
    sudo apt update
    sudo apt install brave-keyring brave-browser
fi

echo "Installing Bat - a cat clone"

if dpkg -s bat &> /dev/null
then
    printf "\t\t%s\n" "✓✓ bat"
else
    curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | jq -r ".assets[] | .browser_download_url" | grep amd64 | grep -v musl | xargs wget -q
    sudo dpkg -i bat*.deb
    rm bat*.deb
fi

echo "Installing vivid"

if dpkg -s vivid &> /dev/null
then
    printf "\t\t%s\n" "✓✓ vivid"
else
    curl -s https://api.github.com/repos/sharkdp/vivid/releases/latest | jq -r ".assets[] | .browser_download_url" | grep amd64 | grep -v musl | xargs wget -q
    sudo dpkg -i vivid*.deb
    rm vivid*.deb
fi
#}}}

echo "Installing screenkey"

cd || exit
mkdir -p ~/Programs
cd ~/Programs || exit

if which screenkey &> /dev/null
then
    printf "\t\t%s\n" "✓✓ screenkey"
else
    git clone https://gitlab.com/wavexx/screenkey
    cd screenkey || exit
    sudo ./setup.py install
fi
cd || exit

################################################################################
