### PATH

# prepend ~/bin
if test -d ~/bin/
    set -U fish_user_paths ~/bin
end

### env

# vim!
set -x EDITOR nvim
# terminal colors
set -x CLICOLOR 1
# color in grep
set -x GREP_OPTIONS '--color=auto'
# email (for git et al)
set -x EMAIL finn@timeghost.net

### aliases

# some ls aliases
alias ll 'ls -l'
alias la 'ls -A'
alias ls 'ls -CF'

alias nview 'nvim -R'
