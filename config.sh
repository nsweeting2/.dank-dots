#####
# ~/.dank-dots/scripts/config.sh
#####

# !/bin/sh

# Author: nsweeting2

##### [ Prerequisites ] ########################################## [ ]
# CatchyOS (no desktop)                                            [ ]
# DankLinux Suite                                                  [ ]
######################################################################
##### [ Configuration Check List ] ######################## [ Status ]
# Run pacman -Syu for updates                                 [ Done ]
# Add hyprland to bash_profile for tty1 logins                [ Done ]
# Install dotdrop via paru                                    [ Done ]
# Use Dotdrop to install the dotfiles                         [ Done ]
# Copy over Wallpapers folder                                 [ Done ]
######################################################################
##### [ Dotdrop Check List ] ############################## [ Status ]
# DarkMateruialShell                                          [ Done ]
# Hyprland                                                    [ Done ]
######################################################################

# Exit the script if anything fails
set -e

# Run pacman -Syu for updates
sudo pacman -Syu

# Add hyprland to bash_profile for tty1 logins
echo 'if [[ $(tty) == /dev/tty1 ]]; then exec Hyprland; fi' >> ~/.bash_profile

# Install dotdrop via paru
paru -S --noconfirm "dotdrop"

# Use Dotdrop to install the dotfiles 
dotdrop install -af

# Copy over Wallpapers folder
mkdir -p ~/Wallpapers
cp -rp ~/.dank-dots/Wallpapers/* ~/Wallpapers 