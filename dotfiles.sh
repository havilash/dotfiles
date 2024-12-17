#!/bin/bash

declare -A PATHS=(
    ["./nvim"]="$HOME/.config/nvim"
    ["./tmux/.tmux.conf"]="$HOME/.tmux.conf"
    ["./starship/starship.toml"]="$HOME/.config/starship.toml"
)

sync_files() {
    local direction=$1  # "backup" or "restore"
    echo "Starting $direction operation..."
    
    for repo_path in "${!PATHS[@]}"; do
        sys_path="${PATHS[$repo_path]}"
        
        if [ "$direction" == "backup" ]; then
            echo "Backing up: $sys_path -> $repo_path"
            mkdir -p "$(dirname "$repo_path")"
            cp -r "$sys_path" "$repo_path"
        elif [ "$direction" == "restore" ]; then
            echo "Restoring: $repo_path -> $sys_path"
            mkdir -p "$(dirname "$sys_path")"
            cp -r "$repo_path" "$sys_path"
        else
            echo "Invalid operation: $direction"
            exit 1
        fi
    done
    
    echo "$direction operation complete."
}

if [ "$1" == "backup" ]; then
    sync_files "backup"
elif [ "$1" == "restore" ]; then
    sync_files "restore"
else
    echo "Usage: $0 {backup|restore}"
    exit 1
fi
