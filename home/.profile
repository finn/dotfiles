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

# add macports sbin if it exists
if [ -d "/opt/local/sbin" ] ; then
    PATH=/opt/local/sbin:$PATH
fi

# add macports bin if it exists
if [ -d "/opt/local/bin" ] ; then
    PATH=/opt/local/bin:$PATH
fi

# add home bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
