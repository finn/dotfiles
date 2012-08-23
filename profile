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

# put /usr/local/bin & sbin before standard system paths
if [ -d "/usr/local/bin" ] ; then
    # remove /usr/local paths
    path_without_usr_local=$(perl -e 'print join(":", grep(!m"/usr/local/s?bin", split(/:/, $ENV{PATH}) ));')
    # and put them in front
    export PATH="/usr/local/bin:/usr/local/sbin:$path_without_usr_local"
fi

# add home bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# vim!
export EDITOR=vim
# terminal colors
export CLICOLOR=1
# color in grep
export GREP_OPTIONS='--color=auto'

# When an interactive shell that is not a login shell  is  started,  bash
# reads  and executes commands from ~/.bashrc, if that file exists.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        source "$HOME/.bashrc"
    fi
fi

git_prompt="$HOME/Documents/projects/git-prompt/git-prompt.sh"
if [ -f $git_prompt ]; then
    [[ $- == *i* ]] && . $git_prompt
fi
