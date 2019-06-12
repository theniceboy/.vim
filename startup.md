### HJKL movements

```vim
noremap u gk
noremap e gj
noremap n h
noremap i l
```

```vim
noremap U 5gk
noremap N 0
noremap E 5gj
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

### Insert

```vim
noremap k i
noremap K I
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

### Other useful stuff

```vim
" cap/uncap letters
map ` ~
```

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

### Plugins

```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```vim
call plug#begin('~/.vim/plugged')

Plug 'connorholyday/vim-snazzy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'

call plug#end()
```

```vim
" Pretty Dress
colorscheme snazzy
let g:SnazzyTransparent = 1
set background=dark
let g:airline_theme='dracula'
```


