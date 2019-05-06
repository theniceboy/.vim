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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'
Plugin 'vim-syntastic/syntastic'
Plugin 'dracula/vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'rhysd/conflict-marker.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-bufferline'
Plugin 'vim-scripts/sessionman.vim'
Plugin 'mbbill/undotree'
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'vim-scripts/restore_view.vim'
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
Plugin 'severin-lemaignan/vim-minimap'
"Bundle 'Valloric/YouCompleteMe'
" Plugin 'taglist.vim'
Plugin 'ron89/thesaurus_query.vim'
Bundle 'gabrielelana/vim-markdown'


call vundle#end()
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
