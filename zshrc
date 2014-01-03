# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

###
### User configuration
###

# TODO function to remove path element from PATH
# TODO function to add path element to PATH

# put /usr/local/bin & sbin before standard system paths
# remove /usr/local paths
path_without_usr_local=$(perl -e 'print join(":", grep(!m"/usr/local/s?bin", split(/:/, $ENV{PATH}) ));')
# and put them in front
export PATH="/usr/local/bin:/usr/local/sbin:$path_without_usr_local"

# add home bin if it exists
export PATH="$HOME/bin:$PATH"

# vim!
export EDITOR=vim
# terminal colors
export CLICOLOR=1
# color in grep
export GREP_OPTIONS='--color=auto'

###
### Alias definitions
###

# ack is called ack-grep on debian/ubuntu
if [ -x /usr/bin/ack-grep ]; then
    alias ack="ack-grep"
fi
# some ls aliases
alias ll='ls -l'
alias la='ls -A'
alias ls='ls -CF'
# location/navigation
alias ..='cd ..'

###
### Completions
###

# zsh-completion (from brew)
local_completions="/usr/local/share/zsh-completions"
if [ -d $local_completions ]; then
   fpath=($local_completions $fpath)
fi
# TODO sqlite completions
#complete -f -X '!*.@(sqlite|sql)' sqlite3 sqlite

###
### Load local shell customizations
###

zshrcd="$HOME/.zshrc.d"
if [[ -d $zshrcd && -r $zshrcd && -x $zshrcd ]]; then
    for f in $(ls "$zshrcd"); do
        f=$zshrcd/$f
        if [[ -f $f && -r $f && $f != *~ && $f != *.bak && $f != *.swp ]]; then
            . $f
        fi
    done
fi

###
### rbenv/plenv/pyenv/virtualenv
###

# load rbenv
if [[ -d "$HOME/.rbenv/bin" ]]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# load plenv for custom perls
if [[ -d "$HOME/.plenv/bin" ]]; then
    export PATH="$HOME/.plenv/bin:$PATH"
    eval "$(plenv init -)"
fi

# TODO pyenv?

# load virtualenvwrapper for python (after custom PATHs)
venvwrap="virtualenvwrapper.sh"
# test if command is available
whence -p $venvwrap > /dev/null
if [ $? -eq 0 ]; then
    venvwrap=`whence -p $venvwrap`
    . $venvwrap
    # make pip respect virtualenv
    export PIP_RESPECT_VIRTUALENV=true
    # make pip respect virtualenvwrapper
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
fi

# vim: filetype=zsh
