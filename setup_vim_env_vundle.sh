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

echo "Setting up vundle"
cd $BUNDLE_DIR
git clone https://github.com/gmarik/Vundle.vim.git Vundle.vim
cd $REPO_DIR

cat <<EOT >> $VIM_RC
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
"Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let python_highlight_all=1

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
nmap <F3>1 :silent Ggrep! -r <C-R><C-W> *.c *.h<CR>:redr!<CR>:copen<CR>
nmap <F3>2 :silent Ggrep! -r <C-R><C-W> *.cpp *.hpp<CR>:redr!<CR>:copen<CR>
nmap <F3>3 :silent Ggrep! -r <C-R><C-W> *.py<CR>:redr!<CR>:copen<CR>
nmap <F3>4 :silent Ggrep! -r <C-R><C-W> *<CR>:redr!<CR>:copen<CR>

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

set clipboard=unnamed

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

set incsearch
EOT

echo "Setting up cscope"
cp $REPO_DIR/vim_configs/cscope_maps.vim $PLUGIN_DIR

