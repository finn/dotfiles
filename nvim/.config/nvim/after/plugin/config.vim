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
"let g:yankring_history_file = '.vim_yankring_history'

" miniyank
" To remap 'p' 'autoput' mapping should be used.
" This will put the same text as unmapped 'p', and supports 'xp' and 'clipboard=unnamed[plus]'
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
" 'startput' will directly put the most recent item in the shared history:
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
" Right after a put, use 'cycle' to go through history:
"map <leader>n <Plug>(miniyank-cycle)
map <C-n> <Plug>(miniyank-cycle)
" Stepped too far? You can cycle back to more recent items using:
"map <leader>N <Plug>(miniyank-cycleback)
map <C-p> <Plug>(miniyank-cycleback)
" Maybe the register type was wrong? Well, you can change it after putting:
map <leader>c <Plug>(miniyank-tochar)
map <leader>l <Plug>(miniyank-toline)
map <leader>b <Plug>(miniyank-toblock)

" vim-rooter
" change to file's directory for non-project files
let g:rooter_change_directory_for_non_project_files = 'current'
" change directory for the current window only
let g:rooter_use_lcd = 1

" TODO alias :Trim to :TrailerTrim

" TODO alias <C-T> to FZF
" TODO get FZF to work off of current directory/project root instead of file

" TODO linting / checking plugin

" TODO beautify / tidying plugin

" TODO fancy powerline fonts for airline?


kjlkjlk
