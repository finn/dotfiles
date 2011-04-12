"coding environment
setlocal tabstop=4 wrapmargin=0 textwidth=0 backspace=1
setlocal nodigraph
setlocal expandtab
setlocal shiftwidth=4
" (0 fixes the placement of function parameters if they span lines
" :0 doesn't indent the labels for case statements.
" g0 fixes the placement of public, private, and protected.
" t0 left justifies the return type declaration.
" c2 Should fix the problem with block comments
":set cinoptions=(0:0g0t0c0
":set cindent
":set smartindent
":set noinfercase
":set infercase
setlocal ruler
setlocal showmatch
"inoremap { {<C-m>}O


"so $HOME/.vim/c-op.vim

"so $HOME/.vim/quickfix.vim
":iunmap {
