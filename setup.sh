#
# ~/.dank-dots/scripts/setup.sh
#

# !/bin/sh

# Author: nsweeting2
# This script is meant to be run on a fresh setup but I have endevored to make it idempotent.
# This is a miniaml setup script, use other scripts for additional packages and configurations.

# This script assumes the following is true: A minimal Arch install via archinstall script,
# Dank Linux setup has been completed: curl -fsSL https://install.danklinux.com | sh
# Dank Linux settings chosen: Hyprland and Kitty (Kitty because failback hyprland.conf uses it)
# Dotdrop will use the default profile, switch profiles with 'COMMAND'

##### [ Configuration Check List ] ######################## [ Status ]
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
# Btop                                                        [  ]
# Fastfetch                                                   [  ]
# Yazi                                                        [  ]
# TUFW                                                        [  ]

# Exit the script if anything fails
set -e

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
aur=(
    "btop"                        # A modern, interactive, and customizable resource monitor (like htop) that shows CPU, memory, and process usage in the terminal.
    "chromium"                    # Chromium is an open-source graphical web browser based on the Blink rendering engine.
    "dotdrop"                     # Save your dotfiles once, deploy them everywhere
    "fastfetch"                   # A high-speed and highly customizable system information fetching tool for the terminal (similar to Neofetch).
    "ghostty"                     # Fast, native, feature-rich terminal emulator pushing modern features
    "nano"                        # A simple, easy-to-use, and lightweight text editor for the command-line interface.
    "tufw"                        # A Terminal User Interface (TUI) for **ufw** (Uncomplicated Firewall), providing an interactive way to manage firewall rules.
    "udiskie"                     # A **UDisks** front-end that automatically mounts and unmounts removable media (like USB drives) with optional notifications and a tray icon.
    "ufw"                         # The **Uncomplicated Firewall**, a program for managing the Netfilter firewall, designed to be easy to use.
    "yazi"                        # A modern, blazing-fast terminal file manager written in Rust, featuring asynchronous I/O and image previews.
)

pacman=()

# Install all defined AUR packages
yay -S --noconfirm "${aur[@]}"

# Use Dotdrop to install the dotfiles 
dotdrop install -af

# Copy over Wallpapers folder
mkdir -p ~/Wallpapers
cp -rp ~/.dank-dots/Wallpapers/* ~/Wallpapers 

































# ? Backup .bash_profile, then symlink from .dank-dots
# Move file to be a .bak
# mv ~/.bash_profile ~/.bash_profile.bak
# Symlink file from repo
# ln -s ~/.dank-dots/bash_profile ~/.bash_profile



# ?. Make Wallpapers folder in Home, then copy Wallpaper folder from .dank-dots 
# Make the Wallpapers folder
# mkdir ~/Wallpapers
# Copy over all of the files
# cp -rp ~/.dank-dots/Wallpapers/* ~/Wallpapers 
# Do this better










