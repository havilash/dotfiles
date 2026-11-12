#!/bin/bash

name="$1"
path="$2"

dashboard="$path/dashboard"
serverless="$path/serverless-functions"

tmux new-session -d -s "$name" -c "$path" -n 'main'
tmux new-window -d -t "$name" -n 'dashboard' -c "$dashboard"
tmux new-window -d -t "$name" -n 'serverless' -c "$serverless"
tmux new-window -d -t "$name" -n 'run' -c "$path"
tmux new-window -d -t "$name" -n 'claude' -c "$path"

tmux split-window -v -t "${name}:run.0" -c "$dashboard/app"
tmux select-layout -t "${name}:run" tiled
tmux split-window -v -t "${name}:run.1" -c "$serverless"
tmux select-layout -t "${name}:run" tiled
tmux split-window -v -t "${name}:run.2" -c "$serverless"

tmux select-layout -t "${name}:run" main-vertical

tmux set -w -t "${name}:run" pane-border-status top
tmux set -w -t "${name}:run" pane-border-format ' #{@title} '
tmux set -p -t "${name}:run.0" @title 'root'
tmux set -p -t "${name}:run.1" @title 'app'
tmux set -p -t "${name}:run.2" @title 'rest-api'
tmux set -p -t "${name}:run.3" @title 'shell'
tmux select-pane -t "${name}:run.0"

sleep 1
tmux send-keys -t "${name}:main" 'nvim' C-m
tmux send-keys -t "${name}:dashboard" 'nvim' C-m
tmux send-keys -t "${name}:serverless" 'nvim' C-m
tmux send-keys -t "${name}:claude" 'claude' C-m

tmux send-keys -t "${name}:run.1" 'npm run dev' C-m
tmux send-keys -t "${name}:run.2" 'pnpm --filter rest-api run dev' C-m

tmux select-window -t "$name:main"
