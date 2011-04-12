# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# When  bash is invoked as an interactive login shell, or as a non-inter-
# active shell with the --login option, it first reads and executes  com-
# mands  from  the file /etc/profile, if that file exists.  After reading
# that file, it looks for ~/.bash_profile, ~/.bash_login, and ~/.profile,
# in  that order, and reads and executes commands from the first one that
# exists and is readable.
# ...
# When  a  login  shell  exits, bash reads and executes commands from the
# file ~/.bash_logout, if it exists.
#
# When an interactive shell that is not a login shell  is  started,  bash
# reads  and executes commands from ~/.bashrc, if that file exists.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

if [ -x /opt/local/bin/port ]; then
     export PATH=/opt/local/bin:/opt/local/sbin:${PATH}
     export MANPATH=/opt/local/share/man:${MANPATH}
     export INFOPATH=/opt/local/share/info:${INFOPATH}
     export LDFLAGS="-L/opt/local/lib ${LDFLAGS}"
     export CPATH=/opt/local/include:${CPATH}
     export PKG_CONFIG_PATH=/opt/local/lib/pkgconfig:${PKG_CONFIG_PATH}
fi

# add home bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# This loads perlbrew into a shell session.
[[ -s "$HOME/perl5/perlbrew/etc/bashrc" ]] && source "$HOME/perl5/perlbrew/etc/bashrc"

# Load python virtualenvwrapper (running on top of python-27 in macports)
[[ -s /opt/local/bin/virtualenvwrapper.sh ]] && source /opt/local/bin/virtualenvwrapper.sh
# make pip respect virtualenv
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
# make pip respect virtualenvwrapper
export PIP_VIRTUALENV_BASE=$WORKON_HOME

export EDITOR=vim
