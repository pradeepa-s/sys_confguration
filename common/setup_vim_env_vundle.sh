#!/bin/bash
#
# Sets up the vim configuration (For ubuntu)

echo "Setting up vim environment for Pradeepa"

echo "Creating the .vimrc"

REPO_DIR=$(pwd)/../
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

Plugin 'vim-scripts/indentpython.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let python_highlight_all=1

set relativenumber
set number
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
nmap <F3>1 :silent grep! <C-R><C-W> --c<CR>:redr!<CR>:copen<CR>
nmap <F3>2 :silent grep! <C-R><C-W> --cpp<CR>:redr!<CR>:copen<CR>
nmap <F3>u2 :silent grep! <C-R><C-W> --cpp -U<CR>:redr!<CR>:copen<CR>
nmap <F3>3 :silent grep! <C-R><C-W> --python<CR>:redr!<CR>:copen<CR>
nmap <F3>4 :silent grep! <C-R><C-W> *<CR>:redr!<CR>:copen<CR>
nmap <F3>0 :silent grep! <C-R><C-W>
nmap <F3>pf :silent grep! "def <C-R><C-W>" *.py<CR>:redr!<CR>:copen<CR>

nmap <space> za
nmap <leader>o :copen<CR>
nmap <leader>c :cclose<CR>
nmap <leader>r :redraw!<CR>
nmap <leader>f :FZF<CR>
nmap <leader>fr :%s/<C-R><C-W>//gc<LEFT><LEFT><LEFT>
nmap <leader>b :ls<CR>:b 
nmap ,jt <ESC>ggi======================<CR>
			\ISSUE<CR>======================<CR><ESC>kk0llll


set tabstop=4
set shiftwidth=4
set textwidth=200

"python PEP8 indentation
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=150 |
	\ set expandtab |
	\ set autoindent |
	\ nmap pdb A<CR>import pdb; pdb.set_trace()

au BufNewFile,BufRead *.cpp
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=150 |
	\ set expandtab |
	\ set autoindent |
	\ nmap <leader>g I// <ESC>

au BufNewFile,BufRead *.hpp
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=150 |
	\ set expandtab |
	\ set autoindent |
	\ nmap <leader>g I// <ESC>

au BufNewFile,BufRead *.c
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=150 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=dos |
	\ nmap <leader>g I// <ESC>

au BufNewFile,BufRead *.h
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=150 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=dos |
	\ nmap <leader>g I// <ESC>

set clipboard=unnamed

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme afterglow
endif

set incsearch

"Flag whitespaces
highlight BadWhitespace ctermbg=darkgreen guibg=lightgreen
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

set incsearch
set cursorline
hi CursorLine term=bold cterm=bold

if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
EOT

echo "Setting up cscope"
cp $REPO_DIR/vim_configs/cscope_maps.vim $PLUGIN_DIR

