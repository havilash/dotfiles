#!/bin/bash

export EDITOR="nvim"
export BROWSER="cachy-browser"
export TERM="alacritty"
export QT_QPA_PLATFORMTHEME="qt5ct"

if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
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
