#
# ~/.dank-dots/scripts/setup.sh
#

# !/bin/sh

# Author: nsweeting2
# This script is meant to be run on a fresh setup but I have endevored to make it idempotent.

# This script assumes the following is true: A minimal Arch install via archinstall script,
# Dank Linux setup has been completed: curl -fsSL https://install.danklinux.com | sh
# Dank Linux settings chosen: Hyprland and Ghostty
# Dotdrop will use the default profile, switch profiles with 'COMMAND'

##### [ Configuration Check List ] ######################## [ Status ]
# Add hyprland to bash_profile for tty1 login                 [ Done ]
# Install yay for all out AUR needs                           [ Done ]
# List all packages to be installed via yay                    [ LOL ]
# List all packages to be installed via pacman                 [ LOL ]
# Install all defined AUR packages                            [ Done ]
# Install all defined pacman packages                         [ Done ]
# Dotdrop will link all the dotfiles on reboot                [ Done ]
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
# Starship                                                    [ Done ]
# Yazi                                                        [ Done ]
# Ufw                                                         [ Done ] 
######################################################################
##### [ App Launcher Check List ] ######################### [ Status ]
# btop                                       [  ]
# Add fastfetch to app launcher                                   [  ]
# Add yazi to app launcher                                        [  ]
# Add TUFW to App launcher                                        [  ]

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
    "7zip"                        # A file archiver with a high compression ratio that supports many formats (7z, XZ, ZIP, RAR, etc.).
    "btop"                        # A modern, interactive, and customizable resource monitor (like htop) that shows CPU, memory, and process usage in the terminal.
    "brave-bin"                   # Web browser that blocks ads and trackers by default (binary release)
    "chromium"                    # An open-source web browser project developed by Google that forms the basis for Google Chrome and Vivaldi.
    "dotdrop"                     # Save your dotfiles once, deploy them everywhere
    "fastfetch"                   # A high-speed and highly customizable system information fetching tool for the terminal (similar to Neofetch).
    "figlet"                      # A command-line program that creates large, stylized ASCII text banners out of ordinary text.
    "fzf"                         # A general-purpose command-line fuzzy finder, used to interactively search and filter lists (files, history, etc.).
    "nano"                        # A simple, easy-to-use, and lightweight text editor for the command-line interface.
    "starship-git"                # A minimal, fast, and customizable prompt for any shell, providing context-aware information (e.g., Git status, language versions).
    "tar"                         # The standard utility for creating and manipulating "tape archive" files, commonly used to bundle files into a single archive (a "tarball").
    "tufw"                        # A Terminal User Interface (TUI) for **ufw** (Uncomplicated Firewall), providing an interactive way to manage firewall rules.
    "udiskie"                     # A **UDisks** front-end that automatically mounts and unmounts removable media (like USB drives) with optional notifications and a tray icon.
    "ufw"                         # The **Uncomplicated Firewall**, a program for managing the Netfilter firewall, designed to be easy to use.
    "vscodium-bin"                # The pre-compiled binary version of VSCodium, a community-driven, telemetry-free distribution of VS Code.
    "wev"                         # A debugging utility for Wayland that creates a window and prints all the Wayland events it receives (analogous to X11's `xev`).
    "yazi"                        # A modern, blazing-fast terminal file manager written in Rust, featuring asynchronous I/O and image previews.
)

pacman=()

# Install all defined AUR packages
yay -S --noconfirm "${aur[@]}"

# Install all defined pacman packages
# NONE YET

# Dotdrop will link all the dotfiles on reboot

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










