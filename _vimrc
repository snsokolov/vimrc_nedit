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

" Case insensitive search
set ignorecase

" Allow you to paste on top of selected text
if !has("unix")
    set guioptions-=aA
endif

" Enable horizontal scrollbar
set guioptions+=b

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
" n - normal mode
" v - visual and select modes
" i - insert mode
"######################################

" Esc Escape from Insert mode (insert mode only)
inoremap <Esc> <C-L>

" Ctrl-S Save the file
nnoremap <C-S> :update!<CR>
vnoremap <C-S> <C-C>:update!<CR>
inoremap <C-S> <C-O>:update!<CR>

" Ctrl-Q Close the file
nnoremap <C-Q> :quit<CR>
vnoremap <C-Q> <C-C>:quit<CR>
inoremap <C-Q> <C-O>:quit<CR>

" Ctrl-A Select all
nnoremap <C-A> gggH<C-O>G
vnoremap <C-A> <C-C><C-O>gg<C-O>gH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G

" Ctrl-V Paste
nnoremap <C-V> "+gP
vnoremap <C-V> "+gP
exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']

" Shift-Insert Paste
nnoremap <S-Insert> "+gP
vnoremap <S-Insert> "+gP
exe 'inoremap <script> <S-Insert> <C-G>u' . paste#paste_cmd['i']

" Ctrl-C Copy (selection mode only)
vnoremap <C-C> "+y

" Ctrl-Ins Copy (selection mode only)
vnoremap <C-Insert> "+y

" Ctrl-X Cut (selection mode only)
vnoremap <C-X> "+x

" Shift-Del Cut (selection mode only)
vnoremap <S-Del> "+x

" Ctrl-F Find all
nnoremap <C-F> /
vnoremap <C-F> "+y/<C-R>"<CR>"
inoremap <C-F> <C-O>/

" Ctrl-H Find next
nnoremap <C-H> n
vnoremap <C-H> "+y/<C-R>"<CR>"
inoremap <C-H> <C-O>n

" Ctrl-G Find previous
nnoremap <C-G> N
vnoremap <C-G> "+y/<C-R>"<CR>"
inoremap <C-G> <C-O>N

" Ctrl-R Replace with confimation
nnoremap <C-R> :%s///gc<left><left><left><left>
vnoremap <C-R> "+y<C-C>:%s/<C-R>"//gc<left><left><left>
inoremap <C-R> <C-O>:%s///gc<left><left><left><left>

" Ctrl-Z Undo
nnoremap <C-Z> u
vnoremap <C-Z> <C-C>u
inoremap <C-Z> <C-O>u

" Ctrl-Y Redo
nnoremap <C-Y> <C-R>
vnoremap <C-Y> <C-C><C-R>
inoremap <C-Y> <C-O><C-R>

" Alt-left indent selection or a single line to the left
nnoremap <A-Left> <
vnoremap <A-Left> <
inoremap <A-Left> <C-O><<

" Alt-right indent selection or a single line to the right
nnoremap <A-Right> >
vnoremap <A-Right> >
inoremap <A-Right> <C-O>>>

" Ctrl-Left Word by word move left (insert mode only)
inoremap <C-Left> <C-O>b

" Ctrl-Right Word by word move right (insert mode only)
inoremap <C-Right> <C-O>w

" Ctrl-Backspace delete word on the left (insert mode only)
inoremap <C-Backspace> <C-O>db

" Ctrl-Del delete word on the right (insert mode only)
inoremap <C-Del> <C-O>dw


"######################################
" 3. Vim Scripts
"######################################

" Remove trailing whitespace every time a file is saved.
au BufWritePre * :%s/\s\+$//e

