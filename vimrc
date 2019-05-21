" todos
" - hotkey to switch between light theme and dark theme

" Auto load for first time uses
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" editor setup
set wildmenu
set number
set relativenumber
set ruler
set cursorline
syntax enable
syntax on
set nocompatible
set laststatus=2
set mouse=a
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set wrap
set autochdir
set showcmd

set encoding=utf-8

set hlsearch
set incsearch
set ignorecase
set smartcase

set indentexpr=

set autoindent
set smartindent
set backspace=indent,eol,start

set splitright
set splitbelow

set foldmethod=indent
set foldlevel=99

set clipboard=unnamed

" Restore Cursor Position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Disabling the default s key
noremap s :echo ""<CR>

" Set <LEADER> as <SPACE>
let mapleader=" "

" Press ; as :
noremap ; :

" Save & quit
map Q :q<CR>
map S :w<CR>

" Open the vimrc file anytime
map <LEADER>rc :e ~/.vim/vimrc<CR>

" Insert Key
noremap k i
noremap K I

" Cursor Movement
noremap u gk
noremap n h
noremap e gj
noremap i l
noremap U 5gk
noremap N 0
noremap E 5gj
noremap I $
"noremap <C-u> <C-y>
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>
"inoremap <C-u> <Esc><C-y>a
"inoremap <C-e> <Esc><C-e>a
inoremap <C-U> <Esc>5<C-y>a
inoremap <C-E> <Esc>5<C-e>a

noremap h e

" Basic operations
noremap l u
noremap L U
inoremap <C-l> <C-u>

" Disable Arrow keys. WE DO NOT NEED THEM
map <up> 5<C-w>+
map <down> 5<C-w>-
map <left> 5<C-w>>
map <right> 5<C-w><

" Window management
map <Leader>w <C-w>w
" map <Leader>u <C-w>k
" map <Leader>e <C-w>j
" map <Leader>n <C-w>h
" map <Leader>i <C-w>l
" map <Leader>r <C-w>r
map su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map se :set splitbelow<CR>:split<CR>
map sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map si :set splitright<CR>:vsplit<CR>

noremap sh <C-w>t<C-w>K
noremap sv <C-w>t<C-w>H


" Tab management
map tu :tabe<CR>
map tn :-tabnext<CR>
map ti :+tabnext<CR>
map tmn :-tabmove<CR>
map tmi :+tabmove<CR>

" Column (:) mods
map ; :
map <LEADER>/ :!
map <LEADER>sr :%s/

" Search
map <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz

" Spelling Check
map <LEADER>sc :set spell!<CR>

" Jump
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

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
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'rhysd/conflict-marker.vim'
Plug 'bling/vim-bufferline'
Plug 'vim-scripts/sessionman.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/indentpython.vim'
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
"Plug 'MattesGroeger/vim-bookmarks'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'ntpeters/vim-better-whitespace', { 'on': ['EnableWhitespace', 'ToggleWhitespace'] } " after :EnableWhitespace, vim slows down
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'kshenoy/vim-signature'

call plug#end()

let has_machine_specific_file = 1
if empty(glob('~/.vim/_machine_specific.vim'))
  let has_machine_specific_file = 0
  exec "!cp ~/.vim/default_configs/_machine_specific_default.vim ~/.vim/_machine_specific.vim"
endif
source ~/.vim/_machine_specific.vim


" dress up my vim
map <LEADER>c1 :set background=dark<CR>:colorscheme snazzy<CR>:AirlineTheme dracula<CR>
map <LEADER>c2 :set background=light<CR>:colorscheme PaperColor<CR>:AirlineTheme PaperColor<CR>

" Set Visuals
colorscheme snazzy
set background=dark
let g:airline_theme='dracula'

let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*


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
let g:ycm_python_binary_path = g:ycm_python_interpreter_path
"let g:ycm_python_interpreter_path = system('which python3')
"let g:ycm_python_binary_path = system('which python3')


" vim-indent-guide
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1

" ale
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']

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
map <C-p> :CtrlP<CR>

" vim-better-whitespace
let g:better_whitespace_enabled=0

" map <LEADER><LEADER> :ToggleWhitespace<CR>

" Goyo
map <LEADER>gy :Goyo<CR>

" CtrlP
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-e>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-u>', '<up>'],
  \ }
" noremap b :AirlineTheme random<CR>

let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" hybridline
" powerline

if has_machine_specific_file == 0
  exec "e ~/.vim/_machine_specific.vim"
endif

