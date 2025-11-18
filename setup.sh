#####
# ~/.dank-dots/scripts/setup.sh
#####

# !/bin/sh

# Author: nsweeting2
# This script is meant to be run on a fresh setup but I have endevored to make it idempotent.
# This is a miniaml setup script, use other scripts for additional packages and configurations.

# This script assumes the following is true: A minimal Arch install via archinstall script,
# Dank Linux setup has been completed: curl -fsSL https://install.danklinux.com | sh
# Dank Linux settings chosen: Hyprland and Kitty (Kitty because failback hyprland.conf uses it)
# Dotdrop will use the default profile, switch profiles with 'COMMAND'

##### [ Configuration Check List ] ######################## [ Status ]
# Run pacman -Syu for updates                                 [  ]
# Add hyprland to bash_profile for tty1 login                 [ Done ]
# Install yay for all out AUR needs                           [ Done ]
# List all packages to be installed via yay                   [ Done ]
# Install all defined AUR packages                            [ Done ]
# Use Dotdrop to install the dotfiles                         [ Done ]
# Copy over Wallpapers folder                                 [ Done ]
######################################################################
##### [ Dotdrop Check List ] ############################## [ Status ]
# DarkMateruialShell                                          [ Done ]
# Hyprland                                                    [ Done ]
# Btop                                                        [ Done ]
# Fastfetch                                                   [ Done ]
# Ghostty                                                     [ Done ]
# Nano                                                        [ Done ]
# Udiskie                                                     [ Done ]
# Yazi                                                        [  ]
# Ufw                                                         [  ] 
######################################################################
##### [ App Launcher Check List ] ######################### [ Status ]
# Btop                                                        [ Done ]
# Fastfetch                                                   [  ]
# Yazi                                                        [  ]
# TUFW                                                        [  ]
######################################################################

# Exit the script if anything fails
set -e

# Run pacman -Syu for updates
sudo pacman -Syu

# Add hyprland to bash_profile for tty1 login
echo 'if [[ $(tty) == /dev/tty1 ]]; then exec Hyprland; fi' >> ~/.bash_profile

# The overall line succeeds, and set -e is not triggered.
which yay || true

# Now you can check the result of 'which yay' in the next line if needed
if ! which yay > /dev/null 2>&1; then
    # Clone yay Repo
    git clone https://aur.archlinux.org/yay.git
    # Run makepkg form yay repo
    cd yay && makepkg --noconfirm -si ; cd ..
fi

# Define all AUR packages to be installed via yay
aur=( "btop" "chromium" "dotdrop" "fastfetch" "ghostty" "nano" "tufw" "udiskie" "ufw" "yazi" )

# Install all defined AUR packages
yay -S --noconfirm "${aur[@]}"

# Use Dotdrop to install the dotfiles 
dotdrop install -af

# Copy over Wallpapers folder
mkdir -p ~/Wallpapers
cp -rp ~/.dank-dots/Wallpapers/* ~/Wallpapers 