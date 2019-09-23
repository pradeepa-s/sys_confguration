#!/bin/bash
#
# Sets up the vim configuration (For ubuntu)

echo "Setting up vim environment for Pradeepa"

echo "Creating the .vimrc"

REPO_DIR=$(pwd)
HOME_DIR=~
VIM_DIR=$HOME_DIR/.vim
VIM_RC=.vimrc

BUNDLE_DIR=$VIM_DIR/bundle
PLUGIN_DIR=$VIM_DIR/plugin

cd $HOME_DIR
mv $VIM_RC $VIM_RC.backup
touch $VIM_RC
mkdir $VIM_DIR
mkdir $BUNDLE_DIR
mkdir $PLUGIN_DIR

cat <<EOT >> $VIM_RC
set relativenumber
set syntax=on
set cindent
nmap <F3> :silent grep! -R --include=*.c --include=*.h <C-R><C-W> *<CR> :redr!<CR> :copen<CR>
EOT

echo "Setting up CTRLP"

cd $VIM_DIR
mkdir bundle
git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
cd $HOME_DIR
echo "set runtimepath^=~/.vim/bundle/ctrlp.vim" >> $VIM_RC

echo "Setting up cscope"
cp $REPO_DIR/vim_configs/cscope_maps.vim $PLUGIN_DIR

