# .vim

## TODO-LIST:

Mac:
alias vim='/Applications/MacVim.app/Contents/bin/mvim -v'

## AutoComplete

If you want to use YCM, you need cmake, and execute `sudo python3 [your vim folder]/plugged/install.py`


## Keyboard Shortcuts for `NORMAL` (`COMMAND`) Mode

### 1 Basic Commands

#### 1.1 The Most Basics 

**`k`** : to switch to **`INSERT`** : mode, equals to key `i`

**`Q`** : quit current vim window, equals to command `:q`

**`S`** : save the current file, equals to command `:s`

**_IMPORTANT_**

  Since the `k` key has been mapped to `i`, every command (combination) that involves `i` should use `k` instead (for example, `ciw` should be `ckw`).

#### 1.2 Cursor Movement

**`u`** : cursor up, equals to `arrow key up` or `gk`

**`e`** : cursor down, equals to `arrow key down` or `gj`

**`n`** : cursor left, equals to `arrow key left` or `h`

**`i`** : cursor right, equals to `arrowkey right` or `l`

**`U`** : cursor up, equals to `arrow key up 5 terminal lines` or `5gk`

**`E`** : cursor down, equals to `arrow key down 5 terminal lines` or `5gj`

**`N`** : cursor left, equals to `arrow key left 5 places` or `5h`

**`I`** : cursor right, equals to `arrow key right 5 places` or `5l`


### 2 Window Management

#### 2.1 Creating Window Through Split Screen

**`su`** : Create a new horizontal split screen and place it above the current window

**`se`** : Create a new horizontal split screen and place it below the current window

**`sn`** : Create a new vertical split screen and place it left to the current window

**`si`** : Create a new vertical split screen and place it right to the current window

#### 2.2 Moving the Cursor Between Different Windows

**`W`** : loop cursor all window in current tab, equals to command (key combination) `Ctrl`+`w` `w`

**`U`** : move cursor to one window up, equals to command (key combination) `Ctrl`+`w` `k`

**`E`** : move cursor to one window down, equals to command (key combination) `Ctrl`+`w` `j`

**`N`** : move cursor to one window left, equals to command (key combination) `Ctrl`+`w` `h`

**`I`** : move cursor to one window right, equals to command (key combination) `Ctrl`+`w` `l`

**`R`** : rotate window , equals to command (key combination) `Ctrl`+`w` `r`

### 3 NERDTree

NERDTree is a rea

#### 3.1 Opening and Closing the NERDTree

**`tt`** : Toggle NERDTree

#### 3.2 Navigating in NERDTree

### 4 AutoComplete (YCM)


**`<SPACE>d`**: Go to definition of the word under cursor 
**`<SPACE>?`**: Go to documentation 
**`<SPACE>t`**: Display type
**`<SPACE>r`**: Go to references

