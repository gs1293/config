#!/bin/bash

#=======================================================================================
#
#  ███╗   ██╗███████╗██╗    ██╗    ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗
#  ████╗  ██║██╔════╝██║    ██║    ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║
#  ██╔██╗ ██║█████╗  ██║ █╗ ██║    ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║
#  ██║╚██╗██║██╔══╝  ██║███╗██║    ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║
#  ██║ ╚████║███████╗╚███╔███╔╝    ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║
#  ╚═╝  ╚═══╝╚══════╝ ╚══╝╚══╝     ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝
#
#=======================================================================================

#{{{ APT PACKAGE LIST
apt_package_list="               \
    texlive-latex-extra          \
    texlive-extra-utils          \
    openssh-client               \
    openssh-server               \
    net-tools                    \
    python-pip                   \
    python3-pip                  \
    python-dev                   \
    python3-dev                  \
    python-gtk2                  \
    python-setuptools            \
    python-distutils-extra       \
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
    vlc                          \
    vim                          \
    vim-gtk3                     \
    vifm                         \
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
    slop                         \
    imagemagick                  \
    procps                       \
    libjpeg8-dev                 \
    zlib1g-dev                   \
    libxtst-dev                  \
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
    ueberzug        \
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
        printf "\t\t%s\n" "Installing $apt_package"
        sudo apt-get install "$apt_package" -y > /dev/null
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
        printf "\t\t%s\n" "Installing $snap_classic_package"
        sudo snap install "$snap_classic_package" --classic > /dev/null
    fi
done

for snap_strict_package in $snap_strict_package_list
do
    if snap list | awk 'NR>=2 {print $1}' | grep -x "$snap_strict_package" &> /dev/null
    then
        printf "\t\t%s\n" "✓✓ $snap_strict_package"
    else
        printf "\t\t%s\n" "Installing $snap_strict_package"
        sudo snap install "$snap_strict_package" > /dev/null
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
        printf "\t\t%s\n" "Installing $pip_package"
        sudo -H pip install "$pip_package" > /dev/null
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
        printf "\t\t%s\n" "Installing $pip3_package"
        sudo -H pip3 install "$pip3_package" > /dev/null
    fi
done
#}}}

################################################################################

#{{{
echo "Updating npm packages"
npm update

echo "Installing npm packages"

for npm_package in $npm_package_list
do
    if npm list -g --depth 0 | awk 'NR>=2 {print $2}' | awk -F "@" '{print $1}' | grep -x "$npm_package" &> /dev/null
    then
        printf "\t\t%s\n" "✓✓ $npm_package"
    else
        printf "\t\t%s\n" "Installing $npm_package"
        sudo npm install -g "$npm_package" > /dev/null
    fi
done
#}}}

################################################################################

#{{{
echo "Installing Other Programs"

if dpkg -s google-chrome-stable &> /dev/null
then
    printf "\t\t%s\n" "✓✓ google-chrome-stable"
else
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    rm google-chrome-stable_current_amd64.deb
fi

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

if dpkg -s bat &> /dev/null
then
    printf "\t\t%s\n" "✓✓ bat"
else
    curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | jq -r ".assets[] | .browser_download_url" | grep amd64 | grep -v musl | xargs wget -q
    sudo dpkg -i bat*.deb
    rm bat*.deb
fi

if dpkg -s vivid &> /dev/null
then
    printf "\t\t%s\n" "✓✓ vivid"
else
    curl -s https://api.github.com/repos/sharkdp/vivid/releases/latest | jq -r ".assets[] | .browser_download_url" | grep amd64 | grep -v musl | xargs wget -q
    sudo dpkg -i vivid*.deb
    rm vivid*.deb
fi

cd || exit
mkdir -p ~/Programs

cd ~/Programs || exit
echo "Installing screenkey"
if which screenkey &> /dev/null
then
    printf "\t\t%s\n" "✓✓ screenkey"
else
    git clone https://gitlab.com/wavexx/screenkey
    cd screenkey || exit
    sudo ./setup.py install
fi

cd ~/Programs || exit
echo "Installing pipes.sh"
if which pipes.sh &> /dev/null
then
    printf "\t\t%s\n" "✓✓ pipes.sh"
else
    git clone https://github.com/pipeseroni/pipes.sh
    cd pipes.sh || exit
    make install
fi
cd || exit

if which lolcat &> /dev/null
then
    printf "\t\t%s\n" "✓✓ lolcat"
else
    sudo gem install lolcat
fi

if dpkg -s iio-sensor-proxy &> /dev/null
then
    sudo apt-get remove iio-sensor-proxy > /dev/null
    printf "\t\t%s\n" "✗✗ iio-sensor-proxy"
    gsettings set org.gnome.settings-daemon.plugins.orientation active false
fi

#}}}

################################################################################

