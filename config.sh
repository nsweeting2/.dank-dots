#####
# ~/.dank-dots/scripts/config.sh
#####

# !/bin/sh

# Author: nsweeting2

##### [ Prerequisites ] ########################################## [#]
# CatchyOS (hyprland)                                              [#]
# DankLinux DMS Setup                                              [#]
######################################################################
##### [ Configuration Steps ] ############################# [ Status ]
# Run pacman -Syu for updates                                [ Coded ]
# Install brave-bin via paru                                 [ Coded ]
# Install dotdrop via paru                                   [ Coded ]
# Use dotdrop to install the dotfiles                        [ Coded ]
# Copy over Wallpapers folder                                [ Coded ]
######################################################################
##### [ Dotdrop Files ] ################################### [ Status ]
# DarkMaterialShell                                         [ Exists ]
# Hyprland                                                  [ Exists ]
######################################################################

# Exit the script if anything fails
set -e

# Run pacman -Syu for updates
sudo pacman -Syu

# Install dotdrop via paru
paru -S --noconfirm "brave-bin"

# Install dotdrop via paru
paru -S --noconfirm "dotdrop"

# Use Dotdrop to install the dotfiles 
dotdrop install -af

# Copy over Wallpapers folder
mkdir -p ~/Wallpapers
cp -rp ~/.dank-dots/Wallpapers/* ~/Wallpapers 