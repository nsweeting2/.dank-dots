#####
# ~/.dank-dots/scripts/defiant.sh
#####

# !/bin/sh

# Author: nsweeting2
# Things I have installed on defiant

##### [ Packages] ########################################### [ Status ]
# VSCodium                                                    [ Done ]
# Remmina
# FreeRDP                                                    [ Done ]
# Remote-Desktop-Manager                                      [ Done ]
# Zoom Workplace                                              [ Done ]
# Samba
# Cups
# Cups-PDF
# Sharepoint-Sync
# VMware Workstation
# Wireshark
# Docker
# Docker-Compose
# Lazydocker
######################################################################

# Exit the script if anything fails
set -e

# Run pacman -Syu for updates
sudo pacman -Syu

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
aur=( "vscodium" "remmina" "remote-desktop-manager" "zoom" )

# Install all defined AUR packages
yay -S --noconfirm "${aur[@]}"