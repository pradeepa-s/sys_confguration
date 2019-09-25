#! /bin/bash

CURRENT_DIR=$(pwd)

cd ~
touch .bashrc
cp .bashrc .bashrc.pradeepa.backup

cat <<EOT >> .bashrc
# Pradeepa's aliases goes here:
alias tmux='tmux -2'
EOT
