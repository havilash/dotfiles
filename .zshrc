#!/bin/zsh

[[ $- != *i* ]] && return

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

HISTCONTROL=ignoreboth
HISTSIZE=1000
SAVEHIST=2000

alias gcob='git branch | fzf | xargs git checkout'
alias dotf=dotfiles
alias lazydotf=lazygitdotfiles
alias reload='source ~/.zshrc'

# nvm
if [ -d "$NVM_DIR" ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# fzf
if command -v fzf &>/dev/null; then
    export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
    eval "$(fzf --zsh)"
fi

# starship
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

# rust/cargo
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# python uv
[ -f "$HOME/.local/bin/env" ] && source "$HOME/.local/bin/env"

function dotfiles {
    /usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" "$@"
}

function lazygitdotfiles {
    lazygit --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
}

# if command -v dotfiles &>/dev/null; then
#     dotfiles config --local status.showUntrackedFiles no
#
#     if dotfiles status --porcelain 2>/dev/null | grep -qE '^(#| M)'; then
#         echo "Warning: Your dotfiles have changes:"
#         dotfiles status --porcelain | awk '{ printf "  - %s\n", $0 }'
#     fi
# fi

# wsl windows home
if command -v whoami.exe &>/dev/null; then
    WIN_USER=$(whoami.exe 2>/dev/null | tr -d '\r' | cut -d'\' -f2)
    WIN_HOME="/mnt/c/Users/$WIN_USER"
    
    if [ -d "$WIN_HOME" ]; then
        export WIN_HOME
        function cdwin { cd "$WIN_HOME" }
    fi
fi
