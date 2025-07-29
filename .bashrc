#!/bin/bash

[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

if [ -n "$force_color_prompt" ] || [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
esac

if command -v dircolors &>/dev/null; then
    eval "$(dircolors -b ~/.dircolors 2>/dev/null || dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias gcob='git branch | fzf | xargs git checkout'
alias reload='source ~/.bashrc'

# nvm
if [ -d "$NVM_DIR" ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

# fzf
if command -v fzf &>/dev/null; then
    export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
    eval "$(fzf --bash)"
fi

# rust/cargo
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

# python uv
if [ -f "$HOME/.local/bin/env" ]; then
    source "$HOME/.local/bin/env"
fi

function .git {
    /usr/bin/git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
}

function .lazygit {
    lazygit --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
}

# wsl windows home
if command -v whoami.exe &>/dev/null; then
    WIN_USER=$(whoami.exe 2>/dev/null | tr -d '\r' | cut -d'\' -f2)
    WIN_HOME="/mnt/c/Users/$WIN_USER"
    
    if [ -d "$WIN_HOME" ]; then
        export WIN_HOME
        function cdwin {
            cd "$WIN_HOME"
        }
    fi
fi

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
