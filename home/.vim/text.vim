set digraph noautoindent textwidth=72 ignorecase
set nonumber nowrap
map U i_hh
":map B xPPahh
":map = dG:!randsig:r ~/.sig
map K :w ^M:!ispell % ^M:e^M^M

":set showbreak='+'

"Coloring changes...
"syntax clear webURL
syntax match webURL "\(http\|ftp\)://[-a-z_0-9\./%#~:]\+"
"syntax match webURL "mailto:"
syntax match webURL "mailto:[-a-z_0-9\.$%]\+@[-a-z_0-9\.$%]\+"me=s+7
highlight webURL ctermfg=yellow
"syntax clear mailURL 
syntax match mailURL "[-a-z_0-9\.$%]\+@[-a-z_0-9\.$%]\+"
highlight mailURL ctermfg=white
highlight mailQuoted1 ctermfg=darkcyan
highlight mailQuoted2 ctermfg=darkgreen
highlight mailQuoted3 ctermfg=darkblue
highlight mailQuoted4 ctermfg=darkblue
highlight mailQuoted5 ctermfg=darkblue
highlight mailQuoted6 ctermfg=darkblue
highlight mailSignature ctermfg=darkgreen
highlight mailHeaderKey ctermfg=darkgreen
highlight mailSubject ctermfg=magenta
"highlight mailHeader ctermfg=darkred   what is this?
highlight mailEmail ctermfg=white
"map ^X !}fmt -c
