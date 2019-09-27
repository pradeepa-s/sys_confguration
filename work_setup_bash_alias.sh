#! /bin/bash

CURRENT_DIR=$(pwd)
MAIN_DIR=/cygdrive/c/src
# MAIN_DIR=~

cd ~
touch .bashrc
cp .bashrc .bashrc.pradeepa.backup

cat <<EOT >> .bashrc

# RESMED aliases goes here:
alias fg1='cd $MAIN_DIR/1/fgapplication'
alias fg2='cd $MAIN_DIR/2/fgapplication'
alias fg3='cd $MAIN_DIR/3/fgapplication'
alias fgm='cd $MAIN_DIR/master/fgapplication'
alias fgf='cd $MAIN_DIR/figshell/Figshell'
EOT

mv /usr/bin/git /usr/bin/cygwin-git

echo "Setting up git environment"

USER_NAME="Pradeepa Senanayake"
USER_EMAIL="pradeepa.senanayake@resmed.com.au"

git config --global user.name "$USER_NAME"
git config --global user.email $USER_EMAIL
git config --global credential.helper store

source ~/.bashrc
