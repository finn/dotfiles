" XXX debug
"set verbose=9

" use ~/.vim in windows too
if has("win32")
    set runtimepath^=~/.vim
endif

set nocompatible
noremap Q gq
set nobackup writebackup
set ignorecase
set smartcase
set fileformat=unix
set shortmess+=I
set vb
set backspace=indent,eol,start
set autoindent
set ruler
set showcmd
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
" always display status line at bottom of vim
set laststatus=2
" fancy statusline with file encoding and BOM
if has("statusline")
    set statusline=%<%f\ %h%m%r%=%{\"[\".&ff.\"]\ \"}%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif
" default to utf-8
set encoding=utf-8
" add a little context to cursor location
set scrolloff=3

" no blinking block cursor
set gcr=n:blinkon0
set autowrite

" highlight searches
set hlsearch
set showmatch
set incsearch
" clear search highlight
nnoremap <C-L> :nohlsearch<cr>:redraw!<cr>

" line numbers
set number
" display invisibles
set list
" highlight cursor line
set cul

"" set path to directory of file being edited
autocmd BufEnter * silent! lcd %:p:h

" softwrap
set linebreak
"set showbreak=>
" show as much of last line as possible instead of @
set display+=lastline

" the whitespace indicators
set listchars=precedes:$,extends:$,tab:»·,trail:·,eol:¬

" TODO
" tweak completion options
"set completeopt=menuone,longest,preview

" TODO
" better cmdline tab completion
"set wildmenu
"set wildmode=list:longest,full

" turn on filetype detection and syntax highlighting
filetype plugin indent on

" map :W to :w for typos
com -nargs=? -complete=file W w <args>

" ctrl-tab and ctrl-shift-tab cycle tabs
if (v:version >= 700)
    noremap <C-Tab> gt
    noremap <C-S-Tab> gT
endif

" get hid of help when you hit f1 instead of esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
