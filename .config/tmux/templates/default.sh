#!/bin/bash

name="$1"
path="$2"

tmux new-session -d -s "$name" -c "$path" -n 'main'
tmux new-window -d -t "$name" -n 'run' -c "$path"

tmux set -w -t "${name}:run" pane-border-status top
tmux set -w -t "${name}:run" pane-border-format ' #{@title} '
tmux set -p -t "${name}:run.0" @title 'root'

sleep 1
tmux send-keys -t "${name}:main" 'nvim' C-m

tmux select-window -t "$name:main"
