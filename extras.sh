#####
# ~/.dank-dots/scripts/extras.sh
#####

# !/bin/sh

#####
# Author: nsweeting2
# Extra things I sometimes install, will promopt for each.
#####

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
aur=(
    # --- Base System & Core Utilities ---
    "acpid"
    "net-tools"
    "bind"
    "xdg-user-dirs"
    "dialog"
    "xz"
    "rsync"
    "less"
    "reflector"
    "trash-cli"
    "tree"
    "starship"
    "openssh"
    "fail2ban"
    "fwupd"
    "sshs"

    # --- Input Drivers ---
    "xf86-input-synaptics"
    "xf86-input-libinput"
    "xf86-input-evdev"

    # --- Graphics (Mesa & Open Source Drivers) ---
    "mesa"
    "lib32-mesa"
    "libva-mesa-driver"
    "lib32-libva-mesa-driver"
    "mesa-vdpau"
    "lib32-mesa-vdpau"
    "libva-vdpau-driver"
    "lib32-libva-vdpau-driver"
    "vulkan-icd-loader"
    "lib32-vulkan-icd-loader"

    # --- AMD/Intel/Nouveau/VMware Graphics Specifics ---
    "vulkan-radeon"
    "lib32-vulkan-radeon"
    "xf86-video-amdgpu"
    "xf86-video-nouveau"
    "xf86-video-intel"
    "vulkan-intel"
    "xf86-video-vmware"
    "xf86-video-fbdev"

    # --- NVIDIA (Proprietary Drivers) ---
    "nvidia"
    "nvidia-utils"
    "lib32-nvidia-utils"
    "libvdpau"
    "lib32-libvdpau"

    # --- Networking & VPN ---
    "networkmanager"
    "networkmanager-openvpn"
    "networkmanager-pptp"
    "networkmanager-vpnc"
    "wireless_tools"
    "wpa_supplicant"
    "ifplugd"
    "tailscale"

    # --- File System Utilities & Mounts ---
    "nfs-utils"
    "cifs-utils"
    "ntfs-3g"
    "exfat-utils"
    "gvfs"
    "udisks2"
    
    # --- Archive/Compression Utilities ---
    "unrar"
    "unarchiver"
    "unzip"
    "unace"
    "7zip"
    "Tar"

    # --- Audio/Sound Management ---
    "alsa-utils"
    "pulseaudio-alsa"
    "pulseaudio-equalizer"
    "pipewire"
    "pipewire-pulse"
    "pipewire-jack"
    "wireplumber"

    # --- Bluetooth ---
    "bluez"
    "bluez-utils"
    "pulseaudio-bluetooth"

    # --- Applications & Fonts ---
    "brave-bin"
    "firefox"
    "onlyoffice"
    "ttf-ms-fonts"
    "obsidian-bin"

    # --- Development & CLI Tools ---
    "fzf"
    "zoxide"
    "vim"
    "neovim"
    "cmatrix"
)
# Loop through each package in the array
for package in "${aur[@]}"; do
    # Prompt the user for confirmation for the specific package
    # 'Y' is set as the default response if the user just presses Enter.
    read -r -p "Do you want to install $package? (y/N, default: N): " response

    # Set default response if input is empty, and convert to lowercase for easy comparison
    response=${response:-N}
    response=$(echo "$response" | tr '[:upper:]' '[:lower:]')

    # Check if the response is 'y'
    if [[ "$response" == "y" ]]; then
        # Install only the current package. --noconfirm is used to skip dependency prompts.
        yay -S --noconfirm "$package"

    fi
done