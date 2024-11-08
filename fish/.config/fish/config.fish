### PATH

# prepend ~/bin to PATH
fish_add_path "$HOME/bin"

### env

# brew
if test -x /opt/homebrew/bin/brew
  eval (/opt/homebrew/bin/brew shellenv)
end
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

if test -e /opt/homebrew/bin/nvim
  alias vi 'nvim'
  alias vim 'nvim'
  alias view 'nvim -R'
  alias nview 'nvim -R'
end

# load plenv (from brew) for custom perls
if type -q plenv;
  status --is-interactive; and source (plenv init -|psub)
end

# load virtualfish if it's present
#eval (python -m virtualfish ^/dev/null)

# iterm2 shell integration
if test -e ~/.iterm2_shell_integration.fish
  source ~/.iterm2_shell_integration.fish
end

# go
set -x GOPATH "$HOME/go"
fish_add_path "$GOPATH/bin"

#if test -x /opt/homebrew/bin/rbenv
#  status --is-interactive; and rbenv init - fish | source
#end

# k8s
fish_add_path "$HOME/.krew/bin"

# rust
fish_add_path "$HOME/.cargo/bin"

# pipx
fish_add_path /Users/fsmith/.local/bin
