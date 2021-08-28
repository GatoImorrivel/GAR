# Update pacman
echo "Updating pacman, just wait a little"
sudo pacman --noconfirm -Syu

# Install dependecies
echo "Installing a bunch of stuff"
sudo pacman -S --noconfirm --needed xorg xorg-xinit bspwm sxhkd lightdm lightdm-gtk-greeter git python3 gcc

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

# Clone and setup alacritty
mkdir ~/alacritty
git clone https://github.com/alacritty/alacritty.git ~/alacritty
cd ~/alacritty

cargo build --release
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# Copying BSPWM, SXHKD and NVIM configs
mkdir ~/.config

mkdir ~/.config/bspwm/
mkdir ~/.config/sxhkd/

sudo cp -r ~/GAR/config/bspwm/bspwmrc ~/.config/bspwm/
sudo cp -r ~/GAR/config/sxhkd/sxhkdrc ~/.config/sxhkd/

# Copying xinit and xprofile
sudo cp ~/GAR/xconfigs/.xinit ~/
sudo cp ~/GAR/xconfigs/.xprofile ~/
