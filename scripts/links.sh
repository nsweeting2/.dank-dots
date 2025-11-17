# File backup function, moves file to be an in place .bak
function backup {
    if [ -f "$1" ]; then
        # Create a timestamp in YYYYMMDD_HHMMSS format
        local timestamp=$(date +%Y%m%d_%H%M%S)
        # Move the original file to a new name with the timestamp
        mv "$1" "${1}_${timestamp}.bak"
    fi
}

# File symlink function, symlinks file to .dank-files
function symlink {
    if [ ! -f $1 ]; then ln -s $1 $2; fi
}

# Backup DankMaterialShell settings.json, then symlink from .dank-dots
default_file="$HOME/.config/DankMaterialShell/settings.json"
dank_file="$HOME/.dank-dots/.config/DankMaterialShell/settings.json"
backup $default_file; sleep 20s; symlink $dank_file $default_file

# Backup Hypr .conf files, then symlink from .dank-dots
default_file="$HOME/.config/hypr/hyprland.conf"
dank_file="$HOME/.dank-dots/.config/hypr/hyprland.conf"
backup $default_file; sleep 20s; symlink $dank_file $default_file