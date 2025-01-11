#!/bin/bash

# Description: Scan a project directory and display file paths and contents, excluding files listed in .gitignore

_usage() {
    echo "Usage: projectscan [OPTIONS] <path>

Scan the project directory and display file paths and contents, excluding files listed in .gitignore.

Options:
  -h, --help                Show this help message and exit.
  -v, --version             Show the version of this program.
  -g, --gitignore           Skip files ignored by .gitignore.
  -c, --contents            Display file contents along with file paths.
  -e, --exclude <pattern>   Exclude files matching the given pattern."
}

_version() {
    echo "lsutil version $VERSION"
}

_load_gitignore() {
    local gitignore_path="$1/.gitignore"
    if [[ -f "$gitignore_path" ]]; then
        gitignore_patterns=()
        while IFS= read -r line; do
            # Skip empty lines and comments
            [[ -z "$line" || "$line" == \#* ]] && continue
            gitignore_patterns+=("$line")
        done <"$gitignore_path"
    fi
}

_is_ignored() {
    local file="$1"
    for pattern in "${gitignore_patterns[@]}"; do
        if [[ "$file" == $pattern || "$file" == $pattern* || "$file" =~ $pattern ]]; then
            return 0
        fi
    done
    return 1
}

_process_files() {
    local base_path="$1"
    local display_contents="$2"
    local exclude_pattern="$3"

    _load_gitignore "$base_path"

    # Use find to iterate through files and directories
    find "$base_path" -type f | while read -r file; do
        # Exclude files matching the given pattern
        if [[ -n "$exclude_pattern" && "$file" =~ $exclude_pattern ]]; then
            continue
        fi

        # Get relative path
        rel_path="${file#$base_path/}"

        if ! _is_ignored "$rel_path"; then
            echo "Path: $rel_path"
            if [[ "$display_contents" == "true" ]]; then
                echo "Contents:"
                cat "$file"
                echo "----------------------------------------"
            fi
        fi
    done
}

main() {
    DISPLAY_CONTENTS="false"
    EXCLUDE_PATTERN=""
    PROJECT_PATH=""

    if [[ $# -eq 0 ]]; then
        _usage
        exit 1
    fi

    while [[ $# -gt 0 ]]; do
        case "$1" in
        -h | --help)
            _usage
            exit 0
            ;;
        -v | --version)
            _version
            exit 0
            ;;
        -c | --contents)
            DISPLAY_CONTENTS="true"
            shift
            ;;
        -g | --gitignore)
            IGNORE="true"
            shift
            ;;
        -e | --exclude)
            EXCLUDE_PATTERN="$2"
            shift 2
            ;;
        *)
            PROJECT_PATH="$1"
            shift
            ;;
        esac
    done

    if [[ -z "$PROJECT_PATH" ]]; then
        echo "Error: Missing project path."
        _usage
        exit 1
    fi

    if [[ ! -d "$PROJECT_PATH" ]]; then
        echo "Error: Path '$PROJECT_PATH' is not a valid directory."
        exit 1
    fi

    _process_files "$PROJECT_PATH" "$DISPLAY_CONTENTS" "$EXCLUDE_PATTERN"
}

main "$@"
