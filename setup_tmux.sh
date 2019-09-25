#! /bin/bash

cd ~
touch .tmux.conf
cp .tmux.conf .tmux.conf.pradeepa.backup

cat <<EOT > .tmux.conf
set -g default-terminal "screen-256color"

set -g status-bg black
set -g status-fg white

set -g status-bg colour240
set -g status on
EOT
