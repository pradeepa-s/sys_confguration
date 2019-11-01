#! /bin/bash

CURRENT_DIR=$(pwd)

cd ~

cp .bashrc .bashrc.pradeepa.backup1
cp .bashrc.pradeepa.backup .bashrc
mv .bashrc.pradeepa.backup1 .bashrc.pradeepa.backup

source ~/.bashrc
