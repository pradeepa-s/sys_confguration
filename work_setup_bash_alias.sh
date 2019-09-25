#! /bin/bash

CURRENT_DIR=$(pwd)

cd ~
touch .bashrc
cp .bashrc .bashrc.pradeepa.backup

cat <<EOT >> .bashrc

# RESMED aliases goes here:
alias fg1='cd /cygdrive/c/src/1/fgapplication'
alias fg2='cd /cygdrive/c/src/2/fgapplication'
alias fg3='cd /cygdrive/c/src/3/fgapplication'
alias fgm='cd /cygdrive/c/src/master/fgapplication'
alias fgf='cd /cygdrive/c/src/figshell/Figshell'
EOT

source ~/.bashrc
