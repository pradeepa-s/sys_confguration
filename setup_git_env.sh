#! /bin/bash

echo "Setting up git environment"

USER_NAME="Pradeepa Senanayake"
USER_EMAIL="pradeepa.senanayake@resmed.com.au"
#USER_EMAIL="pradeepa.kck@gmail.com"

git config --global user.name "$USER_NAME"
git config --global user.email $USER_EMAIL
git config --global core.autocrlf true
