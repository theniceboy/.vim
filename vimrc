set number
syntax on
set nocompatible
set laststatus=2
set mouse=a
filetype on
filetype indent on
filetype plugin on
set tabstop=2
set shiftwidth=2
set wrap
set expandtab

noremap m i
noremap u k
noremap n h
noremap e j
noremap l u
noremap i l

noremap <C-s> <Esc>:w<CR>
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
elseif &filetype == 'sh'
            :!time bash %
elseif &filetype == 'python'
            exec "!time python3 %"
elseif &filetype == 'html'
            exec "!firefox % &"
elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
endif
    endfunc


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'w0rp/ale'
Plugin 'dracula/vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'rhysd/conflict-marker.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-bufferline'
Plugin 'vim-scripts/sessionman.vim'
Plugin 'mbbill/undotree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-scripts/restore_view.vim'
Plugin 'mhinz/vim-signify'
Plugin 'osyo-manga/vim-over'
Plugin 'kana/vim-textobj-user'
Plugin 'gcmt/wildfire.vim'
Plugin 'reedes/vim-wordy'
Plugin 'spf13/PIV'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'gko/vim-coloresque'
Plugin 'mattn/emmet-vim'
Plugin 'spf13/vim-preview'
Plugin 'gabrielelana/vim-markdown'
"Bundle 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on
colorscheme dracula
let g:airline_theme='dracula'

map <C-n> :NERDTreeToggle<CR>
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

let g:indent_guides_enable_on_vim_startup = 1
set indentexpr=

set autoindent
set smartindent
set backspace=indent,eol,start

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

