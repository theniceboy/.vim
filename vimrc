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
    exec "MarkdownPreview"
   " exec "tabe"
   " exec "q"
  endif
endfunc

call plug#begin('~/.vim/plugged')

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
"Bundle 'Valloric/YouCompleteMe'
" Plugin 'taglist.vim'
Plug 'ron89/thesaurus_query.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() } }


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

" ale
" let b:ale_python_flake8_executable = "python3"
" let g:ale_python_flake8_executable = 'python'
" let g:ale_python_flake8_options = '-m flake8'

" MarkdownPreview
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0 

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (126.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'




noremap b :AirlineTheme random<CR>
" hybridline
" powerline
