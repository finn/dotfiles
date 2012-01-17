# ack is called ack-grep on debian/ubuntu
if [ -x /usr/bin/ack-grep ]; then
    alias ack="ack-grep"
fi
# some ls aliases
alias ll='ls -l'
alias la='ls -A'
alias ls='ls -CF'
