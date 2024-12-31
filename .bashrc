# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, exit immediately
case $- in
*i*) ;;
*) return ;;
esac

# History settings
HISTCONTROL=ignoreboth # Ignore duplicates and leading spaces
HISTSIZE=1000          # Number of commands to remember in history
HISTFILESIZE=2000      # Maximum size of the history file
shopt -s histappend    # Append history instead of overwriting

# Adjust window size automatically
shopt -s checkwinsize

# Set the terminal prompt with color support if available
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

# Set the terminal title for xterm
case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
esac

export EDITOR="nvim"

# Tools
## dircolors
if [ -f "$HOME/.dircolors" ]; then
    eval "$(dircolors ~/.dircolors)"
fi

## nvm
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # Load nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # nvm bash completion
fi

## fzf
if [ -f ~/.fzf.bash ]; then
    source ~/.fzf.bash
    export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
fi

## Starship prompt
if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
fi

## dotfiles
function dotfiles {
    /usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" "$@"
}
dotfiles config --local status.showUntrackedFiles no

if dotfiles status --porcelain | grep -qE '^(#| M)'; then
    echo "Warning: Your dotfiles have changes:"
    dotfiles status --porcelain | awk '{ printf "  - %s\n", $0 }'
fi

# Utility
## Reload .bashrc
alias reload='source ~/.bashrc'

## Windows home directory shortcut (for WSL with dynamic Windows user)
WIN_USER=$(whoami.exe | tr -d '\r' | cut -d'\' -f2)
WIN_HOME="/mnt/c/Users/$WIN_USER"

if [ -d $WIN_HOME ]; then
    export WIN_HOME
    function cdwin {
        cd $WIN_HOME
    }
fi

# Programmable Completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Source configuration files
[ -f ~/.bashrc_aliases ] && source ~/.bashrc_aliases
[ -f ~/bin/init.sh ] && source ~/bin/init.sh
