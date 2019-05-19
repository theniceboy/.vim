" todos
" - Git

" Auto load for first time uses
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" editor setup
set number
set relativenumber
set ruler
set cursorline
syntax on
syntax enable
set nocompatible
set laststatus=2
set mouse=a
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set wrap
set expandtab
set autochdir
set showcmd

set hlsearch
set incsearch
set ignorecase
set smartcase

let g:indent_guides_enable_on_vim_startup = 1
set indentexpr=

set autoindent
set smartindent
set backspace=indent,eol,start

" Restore Cursor Position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" Disabling the default s key
noremap s :echo ""<CR>

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
noremap U 5gk
noremap N 5h
noremap E 5gj
noremap I 5l

" Disaoble Arrow keys. WE DO NOT NEED THEM
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Window management
map <Leader>w <C-w>w
" map <Leader>u <C-w>k
" map <Leader>e <C-w>j
" map <Leader>n <C-w>h
" map <Leader>i <C-w>l
" map <Leader>r <C-w>r
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
map <LEADER><CR> :nohlsearch<CR>
noremap = n
noremap - N

" Compile function
autocmd Filetype vim map R :source $MYVIMRC<CR>
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
    exec "clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  endif
endfunc

" Install Plugins with Vim-Plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'vim-syntastic/syntastic'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'rhysd/conflict-marker.vim'
Plug 'bling/vim-bufferline'
Plug 'vim-scripts/sessionman.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-signify'
Plug 'kana/vim-textobj-user'
Plug 'gcmt/wildfire.vim'
Plug 'reedes/vim-wordy'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque'
Plug 'mattn/emmet-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'ron89/thesaurus_query.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'vim-python/python-syntax', { 'for' :['python', 'vim-plug'] }
Plug 'connorholyday/vim-snazzy'
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
Plug 'MattesGroeger/vim-bookmarks'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'tpope/vim-surround'

call plug#end()

" Set Visuals
colorscheme snazzy
let g:airline_theme='dracula'

let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

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

" You Complete ME
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_use_clangd = 0
let g:ycm_python_interpreter_path = '/bin/python3'
let g:ycm_python_binary_path = '/bin/python3'


" ale
" let b:ale_python_flake8_executable = "python3"
" let g:ale_python_flake8_executable = 'python'
" let g:ale_python_flake8_options = '-m flake8'

" MarkdownPreview
let g:mkdp_auto_start = 0 
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" Python-syntax
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" Taglist
map <silent> T :TagbarOpenAutoClose<CR>

" vim-table-mode
map <LEADER>tm :TableModeToggle<CR>

" CtrlP
map <C-p> :CtrlP
" noremap b :AirlineTheme random<CR>
" hybridline
" powerline
