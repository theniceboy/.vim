# .vim

## TODO-LIST:

Mac:
alias vim='/Applications/MacVim.app/Contents/bin/mvim -v'

You need `ctags` for function/class/variable list

## AutoComplete

If you want to use YCM, you need cmake, and execute `sudo python3 [your vim folder]/plugged/install.py`


## Keyboard Shortcuts for `NORMAL` (`COMMAND`) Mode

### 1 Basic Commands

#### 1.1 The Most Basics

**`k`** : to switch to **`INSERT`** : mode, equals to key `i`

**`Q`** : quit current vim window, equals to command `:q`

**`S`** : save the current file, equals to command `:s`

**_IMPORTANT_**

  Since the `i` key has been mapped to `k`, every command (combination) that involves `i` should use `k` instead (for example, `ciw` should be `ckw`).

#### 1.2 Cursor Movement

**`u`** : cursor up, equals to `arrow key up` or `gk`

**`e`** : cursor down, equals to `arrow key down` or `gj`

**`n`** : cursor left, equals to `arrow key left` or `h`

**`i`** : cursor right, equals to `arrowkey right` or `l`

**`U`** : cursor up, equals to `arrow key up 5 terminal lines` or `5gk`

**`E`** : cursor down, equals to `arrow key down 5 terminal lines` or `5gj`

**`N`** : cursor left, equals to `arrow key left 5 places` or `5h`

**`I`** : cursor right, equals to `arrow key right 5 places` or `5l`

#### 1.3 Some Other Commands That Your Moms Don't Tell You

| Command | What it does                       |
|---------|------------------------------------|
| `<C-i>` | Go to the next cursor position     |
| `<C-O>` | Go to the previous cursor position |

### 2 Window Management

#### 2.1 Creating Window Through Split Screen

**`su`** : Create a new horizontal split screen and place it above the current window

**`se`** : Create a new horizontal split screen and place it below the current window

**`sn`** : Create a new vertical split screen and place it left to the current window

**`si`** : Create a new vertical split screen and place it right to the current window

#### 2.2 Moving the Cursor Between Different Windows

| Action                         | Shortcut   | Command  |
|--------------------------------|------------|----------|
| Move cursor to the next window | `<SPACE>w` | `<C-w>w` |

### 3 NERDTree

| Action          | Shortcut | Command           |
|-----------------|----------|-------------------|
| Toggle NerdTree | `tt`     | `:NERDTreeToggle` |

#### 3.2 Navigating in NERDTree

### 4 AutoComplete (YCM)

| Action            | Shortcut | Command                                           |
|-------------------|----------|---------------------------------------------------|
| Go to definition  | `gd`     | `:YcmCompleter GoToDefinitionElseDeclaration<CR>` |
| Get documentation | `g/`     | `:YcmCompleter GetDoc<CR>`                        |
| Get type          | `gt`     | `:YcmCompleter GetType<CR>`                       |
| Go to references  | `gr`     | `:YcmCompleter GoToReferences`                    |

### 5 Bookmarks (vim-bookmarks)

| Action                              | Shortcut | Command                 |
|-------------------------------------|----------|-------------------------|
| Add/remove bookmark at current line | `mm`     | `:BookmarkToggle<CR>`   |
| Add/edit/remove annotation          | `mm`     | `:BookmarkAnnotate<CR>` |
| Jump to the next bookmark in buffer | `mn`     | `:BookmarkNext<CR>`     |
| Jump to the previous bookmark       | `mp`     | `:BookmarkPrev<CR>`     |

For more commands, see [here](https://github.com/MattesGroeger/vim-bookmarks#usage)

### 6 Markdown File Editing

#### 6.1 Edit Table with `vim-table-mode`

Toggle "Table Editing Mode" with `<SPACE>` (equals to command `:TableModeToggle<CR>`)
