#!/bin/bash

export EDITOR="nvim"
export BROWSER="cachy-browser"
export TERM="kitty"
export QT_QPA_PLATFORMTHEME="qt5ct"

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
    [ -d "$HOME/.local/bin/cb" ] && PATH="$HOME/.local/bin/cb/cb.sh:$PATH"
fi

if [ -d "$HOME/.tmuxifier/bin" ]; then
    PATH="$HOME/.tmuxifier/bin:$PATH"
fi

if [ -d "$HOME/.fzf/bin" ]; then
    PATH="$HOME/.fzf/bin:$PATH"
fi

if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
fi

export PATH

[[ -f "~/.bashrc" && $BASH_VERSION ]] && . ~/.bashrc
[[ -f "~/.zshrc" && $ZSH_VERSION ]] && . ~/.zshrc
