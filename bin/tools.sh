#!/bin/bash

sync_nvim_config() {
    CONFIG_PATH="$HOME/.config/nvim/"
    WIN_CONFIG_PATH="$WIN_HOME/AppData/Local/nvim"

    # Validate paths
    if [ ! -d "$CONFIG_PATH" ] || [ -z "$WIN_HOME" ] || [ ! -d "$WIN_CONFIG_PATH" ]; then
        echo "Error: One or more required paths are invalid."
        echo "  - CONFIG_PATH: '$CONFIG_PATH'"
        echo "  - WIN_PATH: '${WIN_HOME:-not set}'"
        echo "  - WIN_CONFIG_PATH: '$WIN_CONFIG_PATH'"
        return 1
    fi

    # Confirm before cleaning
    echo "Target directory: '$WIN_CONFIG_PATH'"
    echo "Existing files will be deleted. Proceed? (yes/no)"
    read -r confirmation
    if [ "$confirmation" != "yes" ]; then
        echo "Operation canceled. Exiting."
        return 0
    fi

    # Cleanup
    echo "Cleaning up old files in '$WIN_CONFIG_PATH'..."
    if ! find "$WIN_CONFIG_PATH" -mindepth 1 -maxdepth 1 ! -name 'install.sh' -exec rm -r {} +; then
        echo "Error during cleanup. Exiting."
        return 1
    fi
    echo "Cleanup complete."

    # Copy files
    echo "Copying files from '$CONFIG_PATH' to '$WIN_CONFIG_PATH'..."
    if ! cp -a "$CONFIG_PATH/." "$WIN_CONFIG_PATH"; then
        echo "Error copying files. Exiting."
        return 1
    fi
    echo "Configuration synced successfully."
}
