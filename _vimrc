" Vimrc_nedit - Nedit like Vim config theme (github.com/snsokolov/vimrc_nedit)

"######################################
" 1. Vim general settings
"######################################

" Use Vim settings, rather than Vi settings. This must be first, because it changes other options
set nocompatible

" Make selections behave like in notepad
behave mswin

" Use temporary directory for a swap file
if has("win32")
    set dir=$TEMP
else
    set dir=/tmp
endif

" Remove 'Tear off' menus
set guioptions-=t

" Set Window and Font size
if has("gui_running")
    " Window size rows and columns
    set lines=40 columns=90
    " Font and Fontsize
    if has("gui_gtk2")
        set guifont=Monospace\ 9
    elseif has("gui_macvim")
        set guifont=Monospace\ 9
    else
        set gfn=Lucida_Console:h9:cRUSSIAN
    endif
endif


" Set encoding to prevent Vim from picking wrong one for Russian texts
set enc=cp1251

" Never wrap long lines on the screen
set nowrap

" Display line numbers
set number

" Inserted tabs are replaced by spaces
set expandtab

" Tab equals to 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4

" No backup files
set nobackup

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Set Autoindentation mode
set autoindent

" Backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Start in insert mode
set im

" Enables incremental search
set incsearch

" Highlight search results
set hlsearch

" Allow you to paste on top of selected text
if !has("unix")
    set guioptions-=a
endif

" Enable syntax highlighting
syntax on

" Enable a starting colorscheme for highlighting
colorscheme zellner

" Changing the color of a comment from Red to Dark Green (Python: # comment)
highlight Comment term=none gui=none ctermfg=DarkGreen guifg=DarkGreen

" Changing the color of identifier to Black (Python: Class name, function name etc)
highlight Identifier term=none gui=none ctermfg=Black guifg=Black

" Changing the color of a statement to Blue (Python: class, def, if etc.)
highlight Statement term=none gui=none ctermfg=Blue guifg=Blue

" Changing the color of a type to Black (not used in Python)
highlight Type term=none gui=none ctermfg=Black guifg=Black


"######################################
" 2. Vim Key mappings similar to Nedit
"######################################

" Esc Escape from Insert mode
inoremap <Esc> <C-L>

" Ctrl-S Save the file
inoremap <C-S> <C-O>:update!<CR>

" Ctrl-A Select all
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G

" Ctrl-Q Close the file (all modes)
noremap  <C-Q>  :quit<CR>
vnoremap <C-Q> <C-C>:quit<CR>
inoremap <C-Q> <C-O>:quit<CR>

" Ctrl-V and SHIFT-Insert Paste (all modes)
noremap  <C-V> "+gP
vnoremap <C-V> "+gP
exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']

imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>

" Ctrl-C and CTRL-Insert Copy (visual selection mode)
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" Ctrl-X and SHIFT-Del Cut (visual selection mode)
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" Ctrl-F Find
if has('gui_running')
    inoremap <C-F> <C-O>:promptfind<CR>
else
    inoremap <C-F> <C-O>/
endif

" Ctrl-G Search
inoremap <C-G> <C-O>/

" Ctrl-H Find selection (visual selection mode)
vnoremap <C-H> "+y/<C-R>"<CR>"
inoremap <C-H> <C-O>n

" Ctrl-R Replace
if has('gui_running')
    inoremap <C-R> <C-O>:promptrepl<CR>
else
    inoremap <C-R> <C-O>/
endif

" Ctrl-Z Undo
inoremap <C-Z> <C-O>u

" Ctrl-Y Redo
inoremap <C-Y> <C-O><C-R>

" Ctrl-arrow/backspace/delete Word by word movement/selection
inoremap <C-Left> <C-O>b
inoremap <C-Right> <C-O>w

"######################################
" 3. Vim Scripts
"######################################

" Remove trailing whitespace every time a file is saved.
au BufWritePre * :%s/\s\+$//e
