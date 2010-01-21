" Vim color file
" Name: boreal.vim
" Author: R. Wharton <ry AT misprint DOT org>
" Version: 1.1
" Url: http://github.com/ryland/vim_colors
"

set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
 
let g:colors_name = "boreal"
 
if has("gui_running")
 
  highlight lineNr guifg=#555657 guibg=#141415
  highlight VertSplit guifg=#808080 guibg=#080808 gui=bold
  highlight StatusLine guifg=#455354 guibg=fg
  highlight StatusLineNC guifg=#333435 guibg=#aaabac
  highlight IncSearch guibg=#16181A
  highlight Cursor guibg=#cccccc
  highlight CursorLine guibg=#16181a
  highlight Search guibg=#16181A guifg=NONE
  highlight MatchParen guibg=#fed078 guifg=#000000
  highlight NonText guifg=#333435 guibg=#16181a;
  highlight WarningMsg guifg=#FFFFFF guibg=#cc3333 gui=bold
  highlight ModeMsg guifg=#75b442
  highlight MatchParen guibg=#00d8ff
  highlight Pmenu guibg=#fed078 guifg=#141415
  highlight PmenuSel guifg=#dddddd guibg=#455354
 
  highlight Normal guifg=#e7e7e9 guibg=#1b1c20
  highlight Keyword guifg=#f69b8c guibg=#141414
  highlight Include guifg=#f2bfcd 
  highlight Include guifg=#466682 
  highlight Identifier guifg=#7aaa9f
  highlight Conditional guifg=#73c836
  highlight Define guifg=#667a90
  highlight Statement guifg=#2e864c 
  highlight Function guifg=#699366 guibg=#141414
  highlight Comment guifg=#444445 guibg=#252529 gui=italic
  highlight SpecialComment guifg=#bbbbbc guibg=#141414 gui=bold
  highlight Type guifg=#bedce7 gui=NONE
  highlight Constant guifg=#f3c902
  highlight String guifg=#75b442 guibg=#121614
  highlight Character guifg=#86c553 guibg=#121614
  highlight Title guifg=#cccccc 
  highlight Todo guifg=#dd2037 guibg=#331111
  highlight Special guifg=#a9cbe0
  highlight Error guifg=#ffffff guibg=#dd2037

" HTML
  highlight htmlTag guifg=#6d6c71 guibg=#141516
  highlight htmlEndTag guifg=#6d6c71 guibg=#141516
  highlight htmlTagName guifg=#999999 guibg=#141516
  highlight htmlArg guifg=#2e864c guibg=#222324
 
"" Ruby 
  highlight rubyClass guifg=#667a90
  highlight rubyInterpolation guibg=#100100
  highlight rubyInterpolationDelimiter guifg=#d3f8a9  guibg=#100100
  highlight rubySymbol guifg=#96a6c8
  highlight rubyConstant guifg=#5098de guibg=#141516
  highlight rubyBlockParameter guifg=#e14794 guibg=#161415
  highlight rubyBlockParameter guifg=#e2c790 guibg=#161415
  highlight rubyInstanceVariable guifg=#a9cbe0 guibg=#141414
  highlight rubyInclude guifg=#466682 
  highlight rubyGlobalVariable guifg=#e52185 guibg=#141414
" 
"" Rails
  highlight rubyRailsMethod guifg=#68b876 guibg=#141414
  highlight rubyRailsUserClass guifg=#89Bdee gui=underline
" 
" 
"" Rails: erb
   highlight erubyDelimiter guifg=#a9cbe0 guibg=#242e38
   highlight erubyRailsRenderMethod guifg=#46a654 guibg=#141414
   highlight erubyRailsHelperMethod guifg=#68b876 guibg=#141414
 
endif
