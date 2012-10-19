autocmd BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn
      \ if &ft =~# '^\%(conf\|modula2\)$' |
      \   set ft=ghmarkdown |
      \ else |
      \   setf ghmarkdown |
      \ endif
