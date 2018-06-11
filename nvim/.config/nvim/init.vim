" XXX debug
"set verbose=9

" use ~/.vim in windows too
if has('win32')
  set runtimepath^=~/.vim
endif

execute pathogen#infect()

""" files
" no backup or swap files, thanks
set nobackup
set nowritebackup
set noswapfile
" write files before :next, :make, etc.
set autowrite
" allow hidden (non-saved) buffers
set hidden
" always default to unix style files
set fileformat=unix

""" display
" adjust messaging
set shortmess+=mIr
set visualbell
set ruler
set showcmd
" always display status line at bottom of vim
set laststatus=2
" add a little context to cursor location
set scrolloff=1
" no blinking block cursor
set guicursor=n:blinkon0
" line numbers
set number
" display invisibles
set list
" highlight cursor line
set cursorline
" softwrap
set linebreak
"set showbreak=↪
set showbreak=↳
" show as much of last line as possible instead of @
set display+=lastline
" the whitespace indicators
set listchars=precedes:$,extends:$,tab:»·,trail:·,eol:¬,nbsp:×
" TODO deprecate in favor of airline?
" fancy statusline with file encoding and BOM
if has('statusline')
  set statusline=%<%f\ %h%m%r%=%{\"[\".&ff.\"]\ \"}%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif
" syntax highlighting
syntax enable
filetype plugin indent on

""" text formatting
set backspace=indent,eol,start
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smarttab
set expandtab

""" search / regexp
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
" clear search highlight
nnoremap <C-L> :nohlsearch<cr>:redraw!<cr>

""" movement, visuals
" don't jump to first char when paging
set nostartofline
set virtualedit=block

""" mouse
set mousemodel=popup

""" splits
set splitbelow
set splitright

" TODO tweak completion options
"set completeopt=menuone,longest,preview

""" cmdline stuff
" more history
set history=10000
set undolevels=10000
" better tab completion
set wildmenu
" TODO tweak completion mode
set wildmode=list:longest,full
"set wildmode=longest:full,full
" only available in later versions (>7)
set wildignorecase

""" autocmds and remaps
" set path to directory of file being edited
autocmd BufEnter * silent! lcd %:p:h
" map :W to :w for typos
com -nargs=? -complete=file W w <args>
" map :E to :e for typos
com -nargs=? -complete=file E e <args>
" TODO gui only?
" ctrl-tab and ctrl-shift-tab cycle tabs
if (v:version >= 700)
  noremap <C-Tab> gt
  noremap <C-S-Tab> gT
endif
" get rid of help when you hit f1 instead of esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" format lines
noremap Q gq

" :BD alias for Bdelete
command! -bang -complete=buffer -nargs=? BD Bdelete<bang> <args>

" shorten updatetime for gitgutter
set updatetime=250

" TODO ?
" errorbells
" visualbells
" linespace
" undofile
" wrap
" textwidth
" formatoptions
" colorcolumn
" list
" listchars
" wildignore
