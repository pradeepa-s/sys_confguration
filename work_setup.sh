#! /bin/bash

CURRENT_DIR=$(pwd)
# MAIN_DIR=/cygdrive/c/src
MAIN_DIR=~/fgrepo

MY_HOME=~

cd $MY_HOME 
touch .bashrc
cp .bashrc .bashrc.pradeepa.backup

cat <<EOT >> .bashrc
# RESMED aliases goes here:
alias fg1='cd $MAIN_DIR/1/fgapplication'
alias fg2='cd $MAIN_DIR/2/fgapplication'
alias fg3='cd $MAIN_DIR/3/fgapplication'
alias fgm='cd $MAIN_DIR/master/fgapplication'
alias fgf='cd $MAIN_DIR/figshell/Figshell'
alias gsu='git submodule update'
alias gsr='git submodule update --init --recursive'
alias fgclone='git clone http://bitbucket.corp.resmed.org/scm/pac/fgapplication.git'
alias fgms='fgm && git pull && gsr && cd Test/Scenarios/Win32 && ss && cd ../Target && ss && cd ../../Unit/SuperUnit/Win32 && ss'
alias fgsetup='mkdir -p $MAIN_DIR/master && cd $MAIN_DIR/master && fgclone && fgms && ./Unit_NoRegion_SupersetAlert.exe && fgm'
EOT

# Force cygwin to use windows git
echo "Setting up git environment"

mv /usr/bin/git /usr/bin/cygwin-git
USER_NAME="Pradeepa Senanayake"
USER_EMAIL="pradeepa.senanayake@resmed.com.au"

git config --global user.name "$USER_NAME"
git config --global user.email $USER_EMAIL
# git config --global credential.helper store

# Hardware configuration for target testing
cat <<EOT >> $MY_HOME/Hw.py
configList = [
    {'muxer': {'fgSl': 'COM4', 'fgBt': None, 'fgCan': 'COM5', 'fgCanCh': 0, 'logFile': 'muxer.log'},
     'stlink': "003700213137510B39383538",
     #'phoneSpec': 'ad05160240186b1a0d,RFCOMM,7FB0449E0078,55888,55889,,True',
    },
]
EOT
