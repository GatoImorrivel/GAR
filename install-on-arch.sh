# Update pacman
echo "Updating pacman, just wait a little"
sudo pacman --noconfirm -Syu

# Install dependecies
echo "Installing a bunch of stuff"
sudo pacman -S --noconfirm --needed xorg xorg-xinit bspwm sxhkd lightdm lightdm-gtk-greeter git python3 gcc base-devel

# Setup lightdm
sudo systemctl enable lightdm

# Installing NVIM
sudo pacman -S --noconfirm --needed neovim

# Install rust for alacritty
echo "##############################"
echo "installing Rust and alacritty"
echo "##############################"
sudo pacman -S --needed rustup cargo

rustup default stable

# Installing paru
mkdir ./.srcs/paru
git clone https://aur.archlinux.org/paru.git ./.srcs/paru
cd ./.srcs/paru
makepkg -si
paru -Syu

# Installing alacritty
paru -S alacritty

# Copying BSPWM, SXHKD and NVIM configs
mkdir ~/.config

mkdir ~/.config/bspwm/
mkdir ~/.config/sxhkd/

sudo cp -r ~/GAR/configs/bspwm/bspwmrc ~/.config/bspwm/
sudo cp -r ~/GAR/configs/sxhkd/sxhkdrc ~/.config/sxhkd/

# Copying xinit and xprofile
sudo cp ~/GAR/xconfigs/.xinit ~/
sudo cp ~/GAR/xconfigs/.xprofile ~/
