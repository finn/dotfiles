" XXX debug
"set verbose=9

" use ~/.vim in windows too
if has("win32")
    set runtimepath^=~/.vim
endif

set nocompatible
noremap Q gq
set nobackup writebackup
set ignorecase smartcase
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
    set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

" XXX commented out to fix on RHEL
" TODO: debold comments, etc.
"if has("terminfo")
"    set t_Co=16
"    set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
"    set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
"else
"    set t_Co=16
"    set t_Sf=[3%dm
"    set t_Sb=[4%dm
"endif


" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
if (v:version >= 600)
    filetype plugin indent on
else
    filetype on
endif

" For all text files set 'textwidth' to 78 characters.
au FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" no blinking cursor
set gcr=a:blinkon0
"set autowrite 

" XXX first stab at:
" clear search highlighting on ^L
" map <C-L> :nohlsearch<CR>:redraw!<CR>

" XXX what does this actually do?
" smart tab completion
"cnoremap <tab> 
"nmap [b :buffers<C-m>:buffer
"nmap [d :buffers<C-m>:bdelete
"nmap [p :bu#<C-m>
"nmap ' `

au BufEnter rc0.* so $VIM/syntax/muttrc.vim

" ruby settings
au FileType ruby setlocal shiftwidth=2 tabstop=2

" html settings
au FileType html setlocal shiftwidth=2 tabstop=2
au FileType xhtml setlocal shiftwidth=2 tabstop=2

" perl settings
" Use perl compiler for all *.pl and *.pm files.
au BufNewFile,BufRead *.pl compiler perl
au BufNewFile,BufRead *.pm compiler perl

" set path to directory of file being edited
if exists('+autochdir')
  set autochdir
else
  "au BufEnter * silent! lcd %:p:h:gs/ /\\ /
  au BufEnter * lcd %:p:h
endif



" make changing lines work correctly with wrapped text
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk 

" softwrap
set linebreak
"set showbreak=>
" show as much of last line as possible instead of @
set display+=lastline

" the whitespace indicators
set listchars=precedes:$,extends:$,tab:»·,trail:·,eol:¬

" encommentify setting
"let g:EnhCommentifyUserMode = 'Yes'
"let g:EnhCommentifyMultiPartBlocks = 'Yes'
"let g:EnhCommentifyUseSyntax = 'Yes'

" svn diff magic
" maps \sd to svn diff when a svn-commit is detected
au BufNewFile,BufRead  svn-commit.* setf svn
au FileType svn map <Leader>sd :SVNCommitDiff<CR>

" better cmdline tab completion
"set wildmenu
set wildmode=list:longest,full

" let's use the mouse in terminals too
set mouse=a

" encoding -- prefer utf-8
if has("multi_byte")
    " avoid messing up keyboard encoding
    if &termencoding == ""
        let &termencoding = &encoding
    end
    " avoid messing up print encoding
    if exists("+printencoding") && (&printencoding == "")
        let &printencoding = &encoding
    end
    " set up file encodings
    " remove unicode settings
    set fileencodings-=ucs-bom
    set fileencodings-=utf-8
    " if empty, add the default encoding
    if (&fileencodings == "") && (&encoding != "utf-8")
        let &fileencodings = &encoding
    end
    " then prepend unicode settings
    set fileencodings^=ucs-bom,utf-8
    set encoding=utf-8
    setglobal fileencoding=utf-8
end

" color settings
if &t_Co > 2
    if (v:version >= 600)
        syntax enable
    else
        syntax on
    endif
    set hlsearch
    "set background=dark
    set showmatch
    " XXX screwing things up?
    so $HOME/.vim/color-dos.vim
endif

if has("gui_running")
    if (v:version >= 600)
        syntax enable
    else
        syntax on
    endif
    " line numbers
    set number
    " display invisibles
    set list
    " search options
    set hlsearch
    set showmatch
    if has("gui_win32")
        " windows font
        set guifont=courier_new:h10
    elseif has("gui_gtk2")
        " linux font
        set guifont=Monospace\ 12
    endif
    "colorscheme ironman
    colorscheme kate
    "colorscheme boreal
    "colorscheme github
    " highlight cursor line
    set cul
endif

" ctrl-tab and ctrl-shift-tab cycle tabs
if (v:version >= 700)
    noremap <C-Tab> gt
    noremap <C-S-Tab> gT
endif

" omni completion
if (v:version >= 700)
    au FileType python set omnifunc=pythoncomplete#Complete
    au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    au FileType html set omnifunc=htmlcomplete#CompleteTags
    au FileType css set omnifunc=csscomplete#CompleteCSS
    au FileType xml set omnifunc=xmlcomplete#CompleteTags
    au FileType php set omnifunc=phpcomplete#CompletePHP
    au FileType c set omnifunc=ccomplete#Complete
endif

" folding
set foldenable
" don't autofold anything
set foldlevel=100

" don't look in .svn directories when doing directory diffs
let g:DirDiffExcludes=".svn"
let g:DirDiffExcludes=".git"

" display the tag list as a menu
let Tlist_Show_Menu = 1
" Automatically update the taglist to include newly edited files.
let Tlist_Auto_Update = 1
" Close the taglist window when a file or tag is selected.
let Tlist_Close_On_Select = 1
" Show prototypes and not tags in the taglist window.
let Tlist_Display_Prototype = 1
" Close Vim if the taglist is the only window.
let Tlist_Exit_OnlyWindow = 1
" Jump to taglist window on open.
let Tlist_GainFocus_On_ToggleOpen = 1
" Single click on a tag jumps to it.
let Tlist_Use_SingleClick = 1
" Don't increase the Vim window width to accommodate the taglist window.
let Tlist_Inc_Winwidth = 0
" Vertically split taglist window width.
let Tlist_WinWidth = 70

" map :W to :w for typos
com -nargs=? -complete=file W w <args>

" TODO if ack is available, use it for grep
"set grepprg=ack
"set grepformat=%f:%l:%m

let python_highlight_all = 1

" TODO why doesn't this work?
" remap CTRL-Space to omni completion
"imap <C-Space> <C-x><C-o>
"inoremap <Nul> <C-x><C-o>

" tweak completion options
set completeopt=menuone,longest,preview
