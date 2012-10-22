# When  bash  is  invoked as an interactive login shell, or as a
# non-interactive shell with the --login option, it first reads and executes
# commands from the file /etc/profile, if that file exists.  After reading that
# file, it looks for ~/.bash_profile, ~/.bash_login, and ~/.profile, in that
# order,  and reads  and  executes  commands from the first one that exists and
# is readable.  The --noprofile option may be used when the shell is started to
# inhibit this behavior.
#
# When a login shell exits, bash reads and executes commands from the file
# ~/.bash_logout, if it exists.
#
# When an interactive shell that is not a login shell is started, bash reads
# and executes commands from ~/.bashrc, if that  file  exists.  This  may  be
# inhibited by using the --norc option.  The --rcfile file option will force
# bash to read and execute commands from file instead of ~/.bashrc.

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

bash_aliases="$HOME/.bash_aliases"
if [ -f $bash_aliases ]; then
    . $bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
etc_complete="/etc/bash_completion"
if [ -f $etc_complete ]; then
    . $etc_complete
fi
# bash-completion (from brew)
local_etc_complete="/usr/local/etc/bash_completion"
if [ -f $local_etc_complete ]; then
     . $local_etc_complete
fi
home_complete="$HOME/.bash_completion"
if [ -f $home_complete ]; then
    source $home_complete
fi

# load perlbrew
PERLBREW_ROOT="$HOME/perl5/perlbrew"
if [ -d $PERLBREW_ROOT ]; then
    export PERLBREW_ROOT
    perlbrew_bashrc="$PERLBREW_ROOT/etc/bashrc"
    [[ -f $perlbrew_bashrc ]] && . $perlbrew_bashrc
fi

# load rvm
#[[ -f "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
#[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

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
            . $f
        fi
    done
fi

# XXX this is slow to load?
# load virtualenvwrapper for python (after custom PATHs)
venvwrap="virtualenvwrapper.sh"
which -s $venvwrap
if [ $? -eq 0 ]; then
    venvwrap=`which $venvwrap`
    . $venvwrap
    # make pip respect virtualenv
    export PIP_RESPECT_VIRTUALENV=true
    # make pip respect virtualenvwrapper
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
fi
