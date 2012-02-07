" custom perltidy command
" invoke with :Tidy
" walks up directory tree and looks for file named
"     perltidyrc
" to load options from
command! -range=% -nargs=* Tidy <line1>,<line2>!
  \perltidy -profile=.../perltidyrc <args>
