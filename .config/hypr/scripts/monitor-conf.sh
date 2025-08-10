#!/usr/bin/bash
# This script creates different monitor profiles for each
# monitor setup and switches between them when moving between setups

function setupHash {
    hyprctl monitors | grep 'description' | cut -d ' ' -f 2- | sort | sha256sum | cut -d ' ' -f 1
}

function changeProfile {
    hash=$(setupHash)

    if [[ -f "$HOME/.config/hypr/conf/monitor.conf.d/$hash.conf" ]]; then
        # Switch to this setup's config
        ln -sf "$HOME/.config/hypr/conf/monitor.conf.d/$hash.conf" "$HOME/.config/hypr/conf/monitor.conf" 
    else
        # Create and switch to this monitor's config
        cp "$HOME/.config/hypr/conf/monitor.conf.d/default.conf" "$HOME/.config/hypr/conf/monitor.conf.d/$hash.conf"
        ln -sf "$HOME/.config/hypr/conf/monitor.conf.d/$hash.conf" "$HOME/.config/hypr/conf/monitor.conf" 
    fi

    hyprctl reload
}

function handle {
    if [[ ${1:0:12} == "monitoradded" ]]; then
        changeProfile
    elif [[ ${1:0:14} == "monitorremoved" ]]; then
        changeProfile
    fi
}

# Set the profile on startup
changeProfile

# Connect to Hyprland socket and handle each event
socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do handle "$line"; done
