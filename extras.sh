#####
# ~/.dank-dots/scripts/extras.sh
#####

# !/bin/sh

#####
# Author: nsweeting2
# Things I sometimes install, will promopt for each.
#####

# Exit the script if anything fails
set -e

# Run pacman -Syu for updates
sudo pacman -Syu

# Define all AUR packages to be installed via paru
aur=(
    # --- Base System & Core Utilities ---
    "cava"
    "i2c-tools"
    
    "net-tools"
    "bind"
    "wireless_tools"
    "rsync"
    "trash-cli"
    "tree"
    "starship"
    "openssh"
    "fail2ban"
    "fwupd"
    "sshs"
    "cmatrix"
    "networkmanager"
    "tailscale"
    "nfs-utils"
    "cifs-utils"
    "ntfs-3g"
    "exfat-utils"
    "gvfs"
    "udisks2"
    "unrar"
    "unarchiver"
    "unzip"
    "unace"
    "7zip"
    "Tar"
    "brave-bin"
    "firefox"
    "vivaldi"
    "google-chrome"
    "chromium"
    "obsidian-bin"
    "fzf"
    "zoxide"
    "vim"
    "neovim"
    "nano"
    "hyprsettings"
    "docker"
    "docker-compose"
    "filezilla"
    "scrcpy"
    "VSCodium"
    "Remmina"
    "FreeRDP"
    "Remote-Desktop-Manager"
    "Zoom Workplace"
    "Samba"
    "Cups"
    "Cups-PDF"
    "Sharepoint-Sync"
    "VMware Workstation"
    "Wireshark"
    "Docker"
    "Docker-Compose"
    "Lazydocker"
    
)
# Loop through each package in the array
for package in "${aur[@]}"; do
    # Prompt the user for confirmation for the specific package
    # 'N' is set as the default response if the user just presses Enter.
    read -r -p "Do you want to install $package? (y/N, default: N): " response

    # Set default response if input is empty, and convert to lowercase for easy comparison
    response=${response:-N}
    response=$(echo "$response" | tr '[:upper:]' '[:lower:]')

    # Check if the response is 'y'
    if [[ "$response" == "y" ]]; then
        # Install only the current package. --noconfirm is used to skip dependency prompts.
        paru -S --noconfirm "$package"

    fi
done