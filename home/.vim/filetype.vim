" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
    au BufRead,BufNewFile *.rake,*.rjs setfiletype ruby
    au BufRead,BufNewFile *.ptl setfiletype python
    " markdown
    au BufRead,BufNewFile *.md,*.mkd,*.markdown setfiletype mkd
    " mediawiki, wikipedia
    au BufRead,BufNewFile *.wiki,*.wikipedia,*.wp,*.mw,*.mediawiki setfiletype Wikipedia
augroup END
