" XXX colorscheme after all plugins have loaded
" (because some colorschemes are loaded as plugins)
if (has('termguicolors'))
  set termguicolors
endif
set background=dark
" italics for colorscheme one/onedark
let g:one_allow_italics = 1
let g:onedark_terminal_italics = 1
colorscheme one
"colorscheme onedark

""" plugin settings

" incsearch
if exists(':IncSearchNoreMap')
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
endif

" TODO gate these and only map when plugin is present

" TODO taglist config

" TODO NERDTree config

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

" TODO alias :Trim to :TrailerTrim

" TODO alias <C-T> to FZF
" TODO get FZF to work off of current directory/project root instead of file

" TODO linting / checking plugin

" TODO beautify / tidying plugin

" TODO fancy powerline fonts for airline?
