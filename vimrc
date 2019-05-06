if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
set autochdir

set hlsearch
set incsearch
set ignorecase
set smartcase

set nosplitright
set nosplitbelow

" Disabling the default s key
noremap s z

" Set <LEADER> as <SPACE>
let mapleader=" "

" Save & quit
map Q :q<CR>
map S :w<CR>

" Insert Key
noremap k i
noremap K I

" Arr
noremap u gk
noremap n h
noremap e gj
noremap l u
noremap i l

" Window management
map W <C-w>w
map U <C-w>k
map E <C-w>j
map N <C-w>h
map I <C-w>l
map R <C-w>r
map su :set nosplitbelow<CR>:split<CR>
map se :set splitbelow<CR>:split<CR>:set nosplitbelow<CR>
map sn :set nosplitright<CR>:vsplit<CR>
map si :set splitright<CR>:vsplit<CR>:set nosplitright<CR>

" Tab management
map tu :tabe<CR>
map tn :-tabnext<CR>
map ti :+tabnext<CR>
map tmn :-tabmove<CR>
map tmi :+tabmove<CR>

" Search
map <CR> :nohlsearch<CR>

" Compile function
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
  elseif &filetype == 'markdown'
   " exec "PreviewMarkdown"
   " exec "tabe"
   " exec "q"
  endif
endfunc

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'vim-syntastic/syntastic'
Plug 'dracula/vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'rhysd/conflict-marker.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'bling/vim-bufferline'
Plug 'vim-scripts/sessionman.vim'
Plug 'mbbill/undotree'
Plug 'nathanaelkane/vim-indent-guides'
" Plugin 'vim-scripts/restore_view.vim'
Plug 'mhinz/vim-signify'
Plug 'osyo-manga/vim-over'
Plug 'kana/vim-textobj-user'
Plug 'gcmt/wildfire.vim'
Plug 'reedes/vim-wordy'
Plug 'spf13/PIV'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque'
Plug 'mattn/emmet-vim'
Plug 'severin-lemaignan/vim-minimap'
"Bundle 'Valloric/YouCompleteMe'
" Plugin 'taglist.vim'
Plug 'ron89/thesaurus_query.vim'
Plug 'gabrielelana/vim-markdown'

call plug#end()

filetype plugin indent on
colorscheme dracula
let g:airline_theme='hybridline'
" let g:airline_theme='dracula'

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


" NERDTree
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

" MiniMap
map m :MinimapUpdate<CR>:MinimapToggle<CR>

" ale
let b:ale_python_flake8_executable = "python3"
let g:ale_python_flake8_executable = 'python'
let g:ale_python_flake8_options = '-m flake8'

" MarkdownPreview
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1


noremap b :AirlineTheme random<CR>
" hybridline
" powerline
