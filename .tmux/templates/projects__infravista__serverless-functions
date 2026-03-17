#!/bin/bash

name="$1"
path="$2"

tmux new-session -d -s "$name" -c "$path" -n 'main'
tmux new-window -d -t "$name" -n 'run' -c "$path"

tmux split-window -h -t "${name}:run" -c "$path"
tmux split-window -v -t "${name}:run.1" -c "$path"

tmux select-layout -t "${name}:run" main-vertical

sleep 1
tmux send-keys -t "${name}:main" 'nvim' C-m
tmux send-keys -t "${name}:run.0" '' C-m
tmux send-keys -t "${name}:run.1" 'sam build --template-file infra/services/rest-api.sam.yaml --config-file ../../samconfig-infra.toml --config-env local --build-in-source; sam local start-api --profile infravista --config-env local --config-file samconfig-infra.toml --port 3001 2>&1 | pino-pretty' C-m
tmux send-keys -t "${name}:run.2" 'pnpm run build:watch' C-m

tmux select-window -t "$name:main"
