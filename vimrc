set number
syntax on
set nocompatible
filetype off
set laststatus=2
set mouse=a
set tabstop=4

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'itchyny/lightline.vim'
Plugin 'w0rp/ale'
Plugin 'shougo/neocomplete.vim'


call vundle#end()
filetype plugin indent on


map <C-n> :NERDTreeToggle<CR>
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

let g:neocomplete#enable_at_startup = 1



