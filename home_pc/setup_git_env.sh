#! /bin/bash

echo "Setting up git environment"

USER_NAME="Pradeepa Senanayake"
USER_EMAIL="pradeepa.kck@gmail.com"

git config --global user.name "$USER_NAME"
git config --global user.email $USER_EMAIL
git config --global core.autocrlf input
git config --global credential.helper store
#git config --global core.editor "C:/cygwin64/bin/vim.exe"
