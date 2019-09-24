#!/bin/bash
#
# Sets up the vim configuration (For ubuntu)

echo "Setting up vim environment for Pradeepa"

echo "Creating the .vimrc"

REPO_DIR=$(pwd)
HOME_DIR=~
VIM_DIR=$HOME_DIR/.vim
VIM_RC=$HOME_DIR/.vimrc

BUNDLE_DIR=$VIM_DIR/bundle
PLUGIN_DIR=$VIM_DIR/plugin

mv $VIM_RC $VIM_RC.backup
touch $VIM_RC
mkdir -p -v $VIM_DIR
mkdir -p -v $BUNDLE_DIR
mkdir -p -v $PLUGIN_DIR

cat <<EOT >> $VIM_RC
set relativenumber
set syntax=on
set cindent

set foldmethod=indent
set foldlevel=99

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"search for text
nmap <F3> :silent grep! -R --include=*.c --include=*.h <C-R><C-W> *<CR> :redr!<CR> :copen<CR>

nmap <space> za

"python PEP8 indentation
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

"Flag whitespaces
highlight BadWhitespace ctermbg=darkgreen guibg=lightgreen
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

EOT

echo "Setting up CTRLP"

cd $BUNDLE_DIR
git clone https://github.com/kien/ctrlp.vim.git ctrlp.vim
echo "set runtimepath^=~/.vim/bundle/ctrlp.vim" >> $VIM_RC
cd $REPO_DIR

echo "Setting up cscope"
cp $REPO_DIR/vim_configs/cscope_maps.vim $PLUGIN_DIR

echo "Setting up fugitive"
cd $BUNDLE_DIR
git clone https://github.com/tpope/vim-fugitive.git vim-fugitive.vim
echo "set runtimepath^=~/.vim/bundle/vim-fugitive.vim" >> $VIM_RC
cd $REPO_DIR

echo "Setting up SimplyFold"
cd $BUNDLE_DIR
git clone https://github.com/tmhedberg/SimpylFold.git SimplyFold.vim
echo "set runtimepath^=~/.vim/bundle/SimpleFold.vim" >> $VIM_RC
cd $REPO_DIR

