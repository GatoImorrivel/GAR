# Update pacman
echo "Updating pacman, just wait a little"
sudo pacman --noconfirm -Syu

# Install dependecies
echo "Installing a bunch of stuff"
sudo pacman -S --noconfirm --needed xorg xorg-xinit\
    bspwm sxhkd                     \
    lightdm lightdm-gtk-greeter     \
    git python3 gcc base-devel      \
    xwallpaper                      \
    ttf-ubuntu-font-family          \
    rofi                            \
    yarn                            \
    nodejs                          \
    npm                             \
    xclip                           \
    cmake                           \
    ttf-nerd-fonts-symbols

# Setup lightdm and nitrogen
sudo systemctl enable lightdm &

# Installing NVIM
sudo pacman -S --noconfirm --needed neovim

# Install rust for alacritty
echo "##############################"
echo "installing Rust and alacritty"
echo "##############################"
sudo pacman -S --needed rustup cargo

rustup default stable

# Installing paru
git clone https://aur.archlinux.org/paru.git ./.srcs/paru
cd ./.srcs/paru
makepkg -si
paru -Syu

# Install picom from jonaburg's repo
paru -S picom-jonaburg-git

# Installing alacritty
paru -S --noconfirm --needed alacritty

# Installing eww
sudo cp -r ~/GAR/bin/eww /usr/bin/

# Nvim plugin stuff
paru -S vim-plug

# Copying BSPWM, SXHKD, NVIM, Alacritty and PICOM configs
mkdir ~/.config

# BSPWM and SXHKD
mkdir ~/.config/bspwm/
mkdir ~/.config/sxhkd/

sudo cp -r ~/GAR/configs/bspwm/bspwmrc ~/.config/bspwm/
sudo cp -r ~/GAR/configs/sxhkd/sxhkdrc ~/.config/sxhkd/

# Alacritty
mkdir ~/.config/alacritty/

sudo cp -r ~/GAR/configs/alacritty/alacritty.yml ~/.config/alacritty/

sudo rm ~/.bashrc

sudo cp ~/GAR/configs/bashrc/.bashrc ~/.bashrc

# Nvim. Thanks uncle!
mkdir ~/.config/nvim/

sudo npm install -g neovim

sudo cp -r ~/GAR/configs/nvim/ ~/.config/nvim/

# Picom
mkdir ~/.config/picom/

sudo cp -r ~/GAR/configs/picom/picom.conf ~/.config/picom/

# Scripts
sudo chmod 777 ~/GAR/configs/scripts/currentwindow
sudo chmod 777 ~/GAR/configs/scripts/previouswindow
sudo chmod 777 ~/GAR/configs/scripts/windowswitch.sh

sudo cp -r ~/GAR/configs/scripts/ ~/.config/scripts/

# Eww
mkdir ~/.config/eww/

sudo cp -r ~/GAR/configs/eww/eww.yuck ~/.config/eww/
sudo cp -r ~/GAR/configs/eww/eww.scss ~/.config/eww/

# Wallpaper
mkdir ~/.config/wallpapers/

sudo cp -r ~/GAR/wallpapers/*.* ~/.config/wallpapers/

# Copying xinit and xprofile
sudo cp ~/GAR/xconfigs/.xinit ~/
sudo cp ~/GAR/xconfigs/.xprofile ~/
