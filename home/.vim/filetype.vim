" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
    au BufRead,BufNewFile *.rake,*.rjs setfiletype ruby
    au BufRead,BufNewFile *.ptl setfiletype python
augroup END
