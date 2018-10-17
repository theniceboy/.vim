set number
syntax on
set nocompatible
filetype off
set laststatus=2
set mouse=a
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set wrap

noremap , h
noremap m j
noremap . l


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'itchyny/lightline.vim'
Plugin 'w0rp/ale'
Bundle 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on


map <C-n> :NERDTreeToggle<CR>
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }


