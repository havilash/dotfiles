#!/bin/bash
# Description: Installs multiple GitHub repositories directly to the $HOME/bin directory.

declare -A REPOS
REPOS=(
    ["cb"]="https://github.com/havilash/cb.git"
)

INSTALL_DIR="$HOME/bin"

install_repo() {
    local repo_name=$1
    local repo_url=$2

    echo "Cloning the repository $repo_name from $repo_url into $INSTALL_DIR..."
    
    # Clone the repo directly into /home/havilash/bin
    git clone --depth 1 "$repo_url" "$INSTALL_DIR/$repo_name" || {
        echo "Error: Failed to clone the repository $repo_name."
        return 1
    }

    if [[ ! -f "$INSTALL_DIR/$repo_name/cb" ]]; then
        echo "Error: cb script not found in the repository $repo_name."
        return 1
    fi

    echo "$repo_name has been successfully installed! You can now use the '$repo_name' command."
}

main() {
    if ! command -v git &>/dev/null; then
        echo "Error: git is required to install the repositories."
        exit 1
    fi

    if [[ ! -d $INSTALL_DIR ]]; then
        echo "Error: Installation directory $INSTALL_DIR does not exist."
        exit 1
    fi

    echo "Available repositories to install:"
    for repo_name in "${!REPOS[@]}"; do
        if [[ -n $repo_name ]]; then
            install_repo "$repo_name" "${REPOS[$repo_name]}"
            break
        else
            echo "Invalid choice. Please select a valid repository."
        fi
    done
}

main
