### Insert

```vim
noremap k i
noremap K I
```

```vim
i (k)
I (K)
o
O
a
A
```

### HJKL movements

```vim
noremap u k
noremap e j
noremap n h
noremap i l
```

```vim
noremap U 5k
noremap N 0
noremap E 5j
noremap I $
```

```vim
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
```

```vim
noremap <C-u> <C-y>
noremap <C-e> <C-e>
```

### Centering the current line

```vim
map <C-c> zz
imap <C-c> zza
```

```vim
:imap <CR> <Esc>zzo
```

### Save, Quit, Reload Vimrc

```vim
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC
map ; :
```

### Editor setup

```vim
syntax on
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
```

```vim
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
```

### Basic operations

```vim
g - gg, G, #G
f
d
y
p
c
u
<C-r>
```

Practice:
```
This is vim: the best editor out there.
Today is a "good day," said my friend.
```

### Searching

```vim
set hlsearch
exec "nohlsearch"
set incsearch
set ignoresearch
set smartcase
```

```vim
noremap = nzz
noremap - Nzz
```

```vim
map <LEADER><CR> :nohlsearch<CR>
```

### Macros

`qa` -> some operations -> `@a` (100@a)

### Basic Plugins (Pretty Dress)

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```vim
call plug#begin('~/.vim/plugged')

Plug 'connorholyday/vim-snazzy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
```

```vim
" Pretty Dress
colorscheme snazzy
let g:SnazzyTransparent = 1
set background=dark
let g:airline_theme='dracula'
```

### Visual Mode

### Visual Block Mode

### Split Screen

```vim
noremap s <nop>
```

```vim
map su :set nosplitbelow<CR>:split<CR>
map se :set splitbelow<CR>:split<CR>
map sn :set nosplitright<CR>:vsplit<CR>
map si :set splitright<CR>:vsplit<CR>
```

```vim
map <LEADER>w <C-w>w
map <LEADER>u <C-w>k
map <LEADER>e <C-w>j
map <LEADER>n <C-w>h
map <LEADER>i <C-w>l
```

```vim
" remap arrow keys to resizing splits
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
```

```vim
" switch between horizontal/vertical split
noremap sh <C-w>t<C-w>K
noremap sv <C-w>t<C-w>H
```

```vim
" rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H
```

### Tabs

```vim
map tu :tabe<CR>
```

```vim
map tn :-tabnext<CR>
map ti :+tabnext<CR>
```

```vim
map tmn :-tabmove<CR>
map tmi :+tabmove<CR>
```

### Some setup for Plugins and some extra setup

```vim
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set wrap
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
```

### YCM

`Plug 'Valloric/YouCompleteMe'`

```vim
" YCM
let g:ycm_python_interpreter_path = "/bin/python3"
let g:ycm_python_binary_path = "/bin/python3"
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_use_clangd = 0
```

### ale

`Plug 'w0rp/ale'`

```vim 
" ale
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']
```

`sudo pip3 install pylint autopep8 yapf`

### 


### Other useful stuff

```vim
" Quick compile key
map r :call CompileRun()
func! CompileRun()
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
    silent! exec "!clear"
    exec "!time sudo python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "Vimwiki2HTMLBrowse"
  endif
endfunc
```

```vim
" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i
```

```vim
" cap/uncap letters
map ` ~
```

```vim
map <LEADER>sc :set spell!<CR>
```

