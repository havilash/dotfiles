#!/bin/bash

# Description: Scan a project directory and display file paths and contents, excluding files listed in .gitignore

VERSION="1.1.1"

print_usage() {
    echo "Usage: projectscan [OPTIONS] <path>

Scan the project directory and display file paths and contents, excluding files listed in .gitignore.

Options:
  -h, --help                Show this help message and exit.
  -v, --version             Show the version of this program.
  -g, --gitignore           Skip files ignored by .gitignore.
  -c, --contents            Display file contents along with file paths.
  -e, --exclude <pattern>   Exclude files matching the given grep-style pattern."
}

print_version() {
    echo "lsutil version $VERSION"
}

is_gitignored() {
    git -C "$project_path" check-ignore -q "$1"
}

process_files() {
    local base_path="$1"
    local use_gitignore="$2"
    local show_contents="$3"
    local -n exclude_patterns_ref="$4"

    find "$base_path" -type f | while read -r file; do
        local rel_path="${file#$base_path/}"

        for pattern in "${exclude_patterns_ref[@]}"; do
            if [[ "$rel_path" =~ $pattern ]]; then
                continue 2
            fi
        done

        if $use_gitignore && is_gitignored "$rel_path"; then
            continue
        fi

        echo "Path: $rel_path"
        if $show_contents; then
            echo "Contents:"
            cat "$file"
            echo "---"
        fi
    done
}

main() {
    local show_contents=false
    local use_gitignore=false
    local -a exclude_patterns=()
    local project_path=""

    if [[ $# -eq 0 ]]; then
        print_usage
        exit 1
    fi

    while [[ $# -gt 0 ]]; do
        case "$1" in
        -h | --help)
            print_usage
            exit 0
            ;;
        -v | --version)
            print_version
            exit 0
            ;;
        -c | --contents)
            show_contents=true
            shift
            ;;
        -g | --gitignore)
            use_gitignore=true
            shift
            ;;
        -e | --exclude)
            exclude_patterns+=("$2")
            shift 2
            ;;
        *)
            project_path="$1"
            shift
            ;;
        esac
    done

    if [[ -z "$project_path" ]]; then
        echo "Error: Missing project path."
        print_usage
        exit 1
    fi

    if [[ ! -d "$project_path" ]]; then
        echo "Error: Path '$project_path' is not a valid directory."
        exit 1
    fi

    process_files "$project_path" "$use_gitignore" "$show_contents" exclude_patterns
}

main "$@"
