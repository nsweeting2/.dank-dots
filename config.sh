#####
# ~/.dank-dots/scripts/config.sh
#####

# !/bin/sh

# Author: nsweeting2

##### [ Prerequisites ] ########################################## [#]
# CatchyOS (hyprland)                                              [#]
# DankLinux DMS Setup                                              [#]
######################################################################
##### [ Configuration Check List ] ######################## [ Status ]
# Run pacman -Syu for updates                                 [ Done ]
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

# Install dotdrop via paru
paru -S --noconfirm "dotdrop"

# Use Dotdrop to install the dotfiles 
dotdrop install -af

# Copy over Wallpapers folder
mkdir -p ~/Wallpapers
cp -rp ~/.dank-dots/Wallpapers/* ~/Wallpapers 