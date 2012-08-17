# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

bash_aliases="~/.bash_aliases"
if [ -f $bash_aliases ]; then
    source $bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
etc_complete="/etc/bash_completion"
if [ -f $etc_complete ]; then
    source $etc_complete
fi
# XXX this is slow to load
# bash-completion (from brew)
local_etc_complete="/usr/local/etc/bash_completion"
if [ -f $local_etc_complete ]; then
    source $local_etc_complete
fi
home_complete="~/.bash_completion"
if [ -f $home_complete ]; then
    source $home_complete
fi

# load perlbrew
PERLBREW_ROOT="$HOME/perl5/perlbrew"
if [ -d $PERLBREW_ROOT ]; then
    export PERLBREW_ROOT
    perlbrew_bashrc="$PERLBREW_ROOT/etc/bashrc"
    [[ -f $perlbrew_bashrc ]] && source $perlbrew_bashrc
fi

# XXX this is slow to load
# load virtualenvwrapper for python
#venvwrap="/usr/local/bin/virtualenvwrapper.sh"
#if [ -f $venvwrap ]; then
#    source $venvwrap
#    # make pip respect virtualenv
#    export PIP_REQUIRE_VIRTUALENV=true
#    export PIP_RESPECT_VIRTUALENV=true
#    # make pip respect virtualenvwrapper
#    export PIP_VIRTUALENV_BASE=$WORKON_HOME
#fi

# load rvm
#[[ -f "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
#[[ -r $rvm_path/scripts/completion ]] && source $rvm_path/scripts/completion

# load rbenv
#if [[ -d "$HOME/.rbenv/bin" ]]; then
#    export PATH="$HOME/.rbenv/bin:$PATH"
#    eval "$(rbenv init -)"
#fi

# load local bash customizations
bashrcd="$HOME/.bashrc.d"
if [[ -d $bashrcd && -r $bashrcd && -x $bashrcd ]]; then
    for f in $(ls "$bashrcd"); do
        f=$bashrcd/$f
        if [[ -f $f && -r $f && $f != *~ && $f != *.bak && $f != *.swp ]]; then
            source $f
        fi
    done
fi
