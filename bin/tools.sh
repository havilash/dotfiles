#!/bin/bash
# Various uitility tools

sync_nvim() {
    CONFIG_PATH="$HOME/.config/nvim/"
    WIN_CONFIG_PATH="$WIN_HOME/AppData/Local/nvim"

    # Validate paths and environment variables
    if [ ! -d "$CONFIG_PATH" ]; then
        echo "Error: Local Neovim config directory '$CONFIG_PATH' does not exist."
        return 1
    fi
    if [ -z "$WIN_HOME" ]; then
        echo "Error: WIN_HOME environment variable is not set."
        return 1
    fi
    if [ ! -d "$WIN_CONFIG_PATH" ]; then
        echo "Error: Windows Neovim config directory '$WIN_CONFIG_PATH' does not exist."
        return 1
    fi

    # Confirm before cleaning
    echo "Target directory: '$WIN_CONFIG_PATH'"
    echo "Warning: All files (except 'install.sh') will be deleted from the target directory."
    echo "Proceed? (yes/no)"
    read -r confirmation
    if [ "$confirmation" != "yes" ]; then
        echo "Operation canceled."
        return 0
    fi

    # Cleanup: Remove old files (except install.sh)
    echo "Cleaning up old files in '$WIN_CONFIG_PATH'..."
    if ! find "$WIN_CONFIG_PATH" -mindepth 1 -maxdepth 1 ! -name 'install.sh' -exec rm -r {} +; then
        echo "Error during cleanup."
        return 1
    fi
    echo "Cleanup complete."

    # Copy configuration files
    echo "Copying files from '$CONFIG_PATH' to '$WIN_CONFIG_PATH'..."
    if ! cp -a "$CONFIG_PATH/." "$WIN_CONFIG_PATH"; then
        echo "Error copying files."
        return 1
    fi
    echo "Configuration synced successfully."
}
