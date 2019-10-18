# Vim Cheatsheet

## Switching Modes

`i` – enter INSERT mode
`v` – enter VISUAL mode
`:` – enter COMMAND mode
`Esc` – return to normal mode

## File operations

`:` `q`  – quit file
`:` `w`  – write file

`:` `q` `!` – force quit editor and discard all changes
`:` `w` `q` – write changes to file and quit editor

## NORMAL mode

**Vim doesn't treat text as just text, but as objects!**

_Typing a number before a motion repeats it that many times._

```
number motion
i.e. 3 w
```

*The format for a change command is:*

```
operator   [number]   motion
    where:
      operator - is what to do, such as  d  for delete
      [number] - is an optional count to repeat the motion
      motion   - moves over the text to operate on, such as  w (word),
                 $ (to the end of line), etc.
```

### Moving the cursor

`j` - move cursor one line up
`k` - move cursor one line down
`h` - move cursor one char left
`l` - move cursor one char right

`b` - move cursor one word to the left
`w` - move cursor one word to the right (beginning of word)
`e` - move cursor one word to the right (end of word)

`0` - move cursor to beginning of current line
`$` - move cursor to end of current line

`3` `w` – move cursor to the beginning of *third* word to the right
`2` `e` – move cursor to the end of *second* word to the right
`4` `b` – move cursor to the beginning of *forth* word to the left

### Inserting text

`Shift` `a` – append text to current line, jumps to end of line and enters INSERT mode

### Deleting text

`x` – delete char under cursor
`5` `x` – delete 5 characters (currently highlighted char and 4 chars to the right) 

`d` `w` – delete word (until the start of the next word, EXCLUDING its first character.)
`d` `e` – delete to the end of the current word, INCLUDING the last character.
`d` `$` – delete to the end of the line, INCLUDING the last character.

`d` `5` `w` – delete 5 words to the right

`d` `d` - delete and copy/yank current line
`4` `d` `d` – delete 4 lines

`c` `w` – delete current word at cursor and enter INSERT mode

`Shift` `d` – delete/yank line and preserve white space

### Undo & Redo

`u` – undo a single change
`Shift` `u` – undo all changes in a single line
`Ctrl` `Shift` `r` – redo a single change

### Put/Paste

`p` - paste/put yanked line

### Replace

`r` – replace character, move cursor to char to be replaced, press `r` and then type the correct character 

### Change operator

`c` `e` – delete everything under the cursor until the end of the word and change to INSERT mode
`c` `w` – delete everything under the cursor until the end of the word and change to INSERT mode
`c` `$` – delete everything under the cursor until the end of the line and change to INSERT mode

## Command combinations

`c` `3` `j` – change current line and 3 lines *down*, put into INSERT mode
`c` `3` `k` – change current line and 3 lines *up*, put into INSERT mode
`c` `4` `h` – change current char plus 3 chars to the *left*, put into INSERT mode
`c` `4` `l` – change current char plus 3 chars to the *right*, put into INSERT mode

`c` `i` `t` – change all contents within an *HTML tag*, put in INSERT mode
`c` `i` `{` – change all contents within a function or code block started by {, put in INSERT mode
`c` `i` `"` – change all contents within a string started by ", put in INSERT mode

## In VISUAL mode

`y` - copy/yank marked text; ends visual mode

## Suspending Vim

`ctrl` `z` - suspend your running Vim editor
`fg` - bring suspended editor back to foreground
[How to temporarily exit vim and go back](https://stackoverflow.com/questions/1879219/how-to-temporarily-exit-vim-and-go-back)