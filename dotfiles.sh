#!/bin/bash
# description: Script to sync configuration files between the repository and the system.

VERSION="1.0.0"

declare -A PATHS=(
    ["./nvim"]="$HOME/.config/nvim"
    ["./tmux/.tmux.conf"]="$HOME/.tmux.conf"
    ["./starship/starship.toml"]="$HOME/.config/starship.toml"
    ["./bashrc/.bashrc"]="$HOME/.bashrc"
    ["./bin/cb"]="$HOME/bin/cb"
    ["./bin/corp"]="$HOME/bin/corp"
)

_usage() {
    cat <<EOF
Usage: $0 [OPTIONS] [COMMAND]

Sync configuration files between the repository and the system.

Options:
  -h, --help           Show this help message and exit.
  -v, --version        Show version information and exit.

Commands:
  backup               Copy files from the system to the repository.
  restore              Copy files from the repository to the system.
EOF
}

_version() {
    echo "$0 version $VERSION"
}

_backup() {
    echo "Starting backup operation..."
    for repo_path in "${!PATHS[@]}"; do
        sys_path="${PATHS[$repo_path]}"
        echo "Backing up: $sys_path -> $repo_path"
        mkdir -p "$(dirname "$repo_path")"
        cp -r "$sys_path" "$repo_path"
    done
    echo "Backup operation complete."
}

_restore() {
    echo "Starting restore operation..."
    for repo_path in "${!PATHS[@]}"; do
        sys_path="${PATHS[$repo_path]}"
        echo "Restoring: $repo_path -> $sys_path"
        mkdir -p "$(dirname "$sys_path")"
        cp -r "$repo_path" "$sys_path"
    done
    echo "Restore operation complete."
}

_main() {
    if [ $# -eq 0 ]; then
        _usage
        exit 1
    fi

    case "$1" in
        -h|--help) _usage; exit 0 ;;
        -v|--version) _version; exit 0 ;;
        backup) _backup ;;
        restore) _restore ;;
        *) echo "Error: Unknown command '$1'"; _usage; exit 1 ;;
    esac
}

_main "$@"
