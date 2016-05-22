" XXX debug
"set verbose=9

" use ~/.vim in windows too
if has("win32")
    set runtimepath^=~/.vim
endif

" pathogen for plugin bundles
execute pathogen#infect()

" vim not vi
" XXX on by default in nvim
"set nocompatible

""" files
" no backup or swap files, thanks
set nobackup
set nowritebackup
set noswapfile
" write files before :next, :make, etc.
set autowrite
" reload changed files
" XXX on by default in nvim
"set autoread
" allow hidden (non-saved) buffers
set hidden
" always default to unix style files
set fileformat=unix
" default to utf-8
" XXX on by default in nvim
"set encoding=utf-8

""" display
" no intro message when launching vim
set shortmess+=I
set visualbell
set ruler
set showcmd
" always display status line at bottom of vim
" XXX on by default in nvim
"set laststatus=2
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
" XXX on by default in nvim
"set ttyfast
" softwrap
set linebreak
"set showbreak=↪
set showbreak=↳
" show as much of last line as possible instead of @
" XXX on by default in nvim
"set display+=lastline
" the whitespace indicators
set listchars=precedes:$,extends:$,tab:»·,trail:·,eol:¬,nbsp:×
" fancy statusline with file encoding and BOM
if has("statusline")
    set statusline=%<%f\ %h%m%r%=%{\"[\".&ff.\"]\ \"}%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

""" filetypes, syntax coloring
" turn on filetype detection and syntax highlighting
" XXX on by default in nvim
"syntax enable
" XXX on by default in nvim
"filetype plugin indent on
set background=dark

""" text formatting
" XXX on by default in nvim
"set backspace=indent,eol,start
" XXX on by default in nvim
"set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smarttab
set expandtab

""" search / regexp
set ignorecase
set smartcase
" highlight searches
" XXX on by default in nvim
"set hlsearch
set showmatch
" XXX on by default in nvim
"set incsearch
" clear search highlight
nnoremap <C-L> :nohlsearch<cr>:redraw!<cr>
" very magic makes parens more sane
" TODO do these apply to :s// where I care about them?
"nnoremap / /\v
"vnoremap / /\v
" g for global flag by default
set gdefault

""" movement, visuals
" don't jump to first char when paging
set nostartofline
set virtualedit=block

""" mouse
set mousemodel=popup

""" splits
set splitbelow
set splitright

" TODO
" tweak completion options
"set completeopt=menuone,longest,preview

""" cmdline stuff
" more history
" XXX to 10000 by default in nvim
"set history=1000
set undolevels=1000
" better tab completion
" XXX on by default in nvim
"set wildmenu
set wildmode=list:longest,full
"set wildmode=longest:full,full
" TODO figure out how to detect if this is available or not
" only available in later versions
"if (v:version >= 703)
    "set wildignorecase
"endif

""" autocmds and remaps
" set path to directory of file being edited
autocmd BufEnter * silent! lcd %:p:h
" map :W to :w for typos
com -nargs=? -complete=file W w <args>
" map :E to :e for typos
com -nargs=? -complete=file E e <args>
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

""" plugin settings

" TODO taglist config

" TODO NERDTree config

" NERDTree tabs config
map <Leader>n <plug>NERDTreeTabsToggle<CR>
" always focus file pane on startup
let g:nerdtree_tabs_smart_startup_focus = 2
"let g:nerdtree_tabs_autoclose = 0

" solarized
if ( has('gui_running') || &t_Co == 256 )
    let g:solarized_termcolors=256
    colorscheme solarized
endif

" powerline
" TODO re-enable once powerline isn't broken
"let g:Powerline_symbols = 'fancy'

" tcomment
" always put comment string in the first column
let g:tcommentOptions = {'col': 1}
" redefine some commonish comment types to remove leading whitespace
let g:tcomment_types = {
            \ 'apache':           '#%s',
            \ 'cpp':              '//%s',
            \ 'cfg':              '#%s',
            \ 'conf':             '#%s',
            \ 'crontab':          '#%s',
            \ 'cs':               '//%s',
            \ 'fstab':            '#%s',
            \ 'gitcommit':        '#%s',
            \ 'gitignore':        '#%s',
            \ 'javaScript':       '//%s',
            \ 'javascript':       '//%s',
            \ 'java':             '//%s',
            \ 'perl':             '#%s',
            \ 'puppet':           '#%s',
            \ 'python':           '#%s',
            \ 'ruby':             '#%s',
            \ 'ruby_3':           '###%s',
            \ 'sh':               '#%s',
            \ 'vim':              '"%s',
            \ 'vim_3':            '"""%s',
            \ 'yaml':             '#%s',
            \ }

" markdown
let g:markdown_fenced_languages = [
            \ 'ruby',
            \ 'perl',
            \ 'python',
            \ 'javascript',
            \ 'html',
            \ 'sql',
            \ 'php',
            \ 'css',
            \ 'java',
            \ 'cpp',
            \ 'apache',
            \ ]

" yankring
let g:yankring_history_file = '.vim_yankring_history'

" ctrlp
let g:ctrlp_map = '<C-J>'
let g:ctrlp_cmd = 'CtrlP'

"set fuoptions=maxvert

" :BD alias for Bdelete
command! -bang -complete=buffer -nargs=? BD Bdelete<bang> <args>

" TODO alias :Trim to :TrailerTrim

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