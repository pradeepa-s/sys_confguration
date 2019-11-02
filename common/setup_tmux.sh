#! /bin/bash

cd ~
touch .tmux.conf
cp .tmux.conf .tmux.conf.pradeepa.backup

cat <<EOT > .tmux.conf
set -g base-index 1

set-environment -g CHERE_INVOKING 1
set-window-option -g automatic-rename on
set-option -g set-titles on

set -g status-keys vi
set -g history-limit 10000

set -g default-terminal "screen-256color"

setw -g mode-keys vi
setw -g monitor-activity on

bind-key v split-window -h -c "#{pane_current_path}"
bind-key s split-window -v -c "#{pane_current_path}"
bind c new-window -c "#{pane_current_path}"

bind-key J resize-pane -D 5
bind-key K resize-pane -U 5
bind-key H resize-pane -L 5
bind-key L resize-pane -R 5

bind-key M-j resize-pane -D
bind-key M-k resize-pane -U
bind-key M-h resize-pane -L
bind-key M-l resize-pane -R

bind h select-pane -L
bind j select-pane -D 
bind k select-pane -U
bind l select-pane -R

bind -n M-h select-pane -L
bind -n M-j select-pane -D 
bind -n M-k select-pane -U
bind -n M-l select-pane -R

bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

bind-key Z resize-pane -Z

set -sg escape-time 0

bind P paste-buffer
bind-key -T copt-mode-vi v send-keys -X begin-selection
bind-key -T copt-mode-vi y send-keys -X copy-selection
bind-key -T copt-mode-vi r send-keys -X rectangle-toggle

bind r source-file ~/.tmux.conf

# THEME
set -g status-bg colour240
set -g status-fg white
set -g window-status-current-style bg=white,fg=black,bold
set -g status-interval 60
set -g status-left-length 30
set -g status-left '#[fg=white](#S) #(whoami) '
set -g status-right '#[fg=yellow]#(cut -d " " -f 1-3 /proc/loadavg)#[default] #[fg=white]%H:%M#[default]'
EOT
