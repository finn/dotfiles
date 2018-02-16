### PATH

# prepend ~/bin to PATH
if test -d ~/bin
  set -U fish_user_paths ~/bin
end

### env

# vim!
set -x EDITOR vim
# terminal colors
set -x CLICOLOR 1
# color in grep
set -x GREP_OPTIONS '--color=auto'
# set default email if not set (for git et al)
set -q EMAIL; or set -x EMAIL finn@timeghost.net
# fzf opts
set -x FZF_DEFAULT_COMMAND 'rg --hidden -g "!.git/" --files'
set -x FZF_DEFAULT_OPTS '--reverse --border --cycle --tabstop=4 --no-extended'
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

### aliases

# ag/rg with smart case + sort files by default
alias ag 'ag --smart-case'
alias rg 'rg --smart-case --sort-files'

# some ls aliases
alias ll 'ls -l'
alias la 'ls -A'
alias ls 'ls -CF'

if test -e /usr/local/bin/nvim
  alias vi 'nvim'
  alias vim 'nvim'
  alias view 'nvim -R'
  alias nview 'nvim -R'
end

# load plenv for custom perls
if test -d ~/.plenv/bin
  set -x PATH ~/.plenv/bin $PATH
  status --is-interactive; and source (plenv init -|psub)
end

# load virtualfish if it's present
eval (python -m virtualfish ^/dev/null)

# iterm2 shell integration
if test -e ~/.iterm2_shell_integration.fish
  source ~/.iterm2_shell_integration.fish
end
