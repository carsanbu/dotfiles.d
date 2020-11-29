#!/bin/bash

sudo apt install git zsh stow neovim python3-pip python3-dev python3-setuptools xss-lock
# Dependencias i3lock-color 
sudo apt install imagemagick autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev  

stow -t ../.config .config

if [ ! -L ~/.zshrc ]; then
ln -s ~/.dotfiles.d/zsh/.zshrc ~/.zshrc
fi

if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom} ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	ln -s ~/.dotfiles.d/zsh/.p10k.zsh ~/.p10k.zsh
	mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
fi

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo pip3 install qtile thefuck

echo '[Desktop Entry]
Name=Qtile
Comment=Qtile Session
Exec='$HOME'/.local/bin/qtile
Type=Application
Keywords=wm;tiling
EOF' | sudo tee /usr/share/xsessions/qtile.desktop > /dev/null 

mkdir .install && cd .install

# Lockscreen 
git clone https://github.com/Raymo111/i3lock-color.git && cd i3lock-color
chmod +x build.sh && ./build.sh
chmod +x install-i3lock-color.sh && ./install-i3lock-color.sh

cd ..
git clone https://github.com/jeffmhubbard/multilockscreen && cd multilockscreen
sudo install -Dm 755 multilockscreen /usr/local/bin/multilockscreen
multilockscreen -u ~/Imágenes/wallpapers/1606483234331.jpg


