" black
" darkred
" brown
" red
" yellow
" magenta
" lightred
" lightmagenta
" lightyellow

" darkgreen
" green
" lightgreen

" darkmagenta   Type
" darkblue      Identifier, Function
" darkcyan      Statement
" lightgray
" darkgray      Comment, SpecialComment
" blue
" cyan
" white         Operator, Special
" grey/normal
" lightblue     Conditional, Repeat, Label, Keyword, Exception, StorageClass,
"               PreProc
" lightcyan

"              lightgray == gray, magenta == purple, darkyellow == brown?
"              lightcyan == cyan
"
"              bad: brown, red

" color settings for the cygwin dos shell. kinda ugly, unfortunately

"" *COLOR*
" Normal
highlight Normal ctermfg=NONE

"" *COLOR*
" Comment
highlight Comment ctermfg=darkgray
highlight SpecialComment ctermfg=darkgray

" do I want constant instead of string/number/float/boolean
" Constants

"" *COLOR1*
" string -- do I want it different? probably...
highlight String ctermfg=NONE 

"" *COLOR2*
" these should all be the same
" Constants : character, number, boolean, float [string]
highlight Constant ctermfg=NONE

"" *COLOR3*
" Identifiers
highlight Identifier ctermfg=lightblue 
highlight Function ctermfg=lightblue

"" *COLOR4*
" Statements
hi link Conditional ReservedWord
hi link Repeat ReservedWord
hi link Label ReservedWord
hi link Keyword ReservedWord
hi link Exception ReservedWord
" Type
hi link StorageClass ReservedWord
highlight ReservedWord ctermfg=lightblue

"" *COLOR5*
" Statements
highlight Statement ctermfg=darkcyan 
highlight Operator ctermfg=white 

"" *COLOR6*
" PreProc : include, define, macro, precondit
highlight PreProc ctermfg=lightblue 

"" *COLOR7*
" Type : structure, typedef [StorageClass]
highlight Type ctermfg=darkmagenta

"" *COLOR8*
" Special : specialchar, tag, delimiter, debug [specialcomment]
highlight Special ctermfg=white

"" *COLOR9*
" Error
highlight Error ctermfg=NONE ctermbg=red
" Todo
highlight Todo ctermfg=NONE ctermbg=red
