Usage:

* clone `dotfiles` repo to `$HOME` directory
* install `brew`
* install `stow`
  * `brew install stow`
* install all dotfiles
  * `make`
* install specific dotfiles
  * `make <target>`

e.g.

    make fish

Contents:

    dotfiles/
    ├── Makefile
    ├── README.md
    ├── ack/
    │   └── .ackrc
    ├── bash/
    │   ├── .bash_aliases
    │   ├── .bash_completion
    │   ├── .bash_logout
    │   ├── .bash_profile
    │   ├── .bashrc
    │   └── .fzf.bash
    ├── fish/
    │   └── .config/
    │       └── fish/
    │           ├── config.fish
    │           └── functions/
    │               ├── fish_user_key_bindings.fish
    │               └── fzf_key_bindings.fish@
    ├── git/
    │   ├── .git.core.excludesfile
    │   └── .gitconfig
    ├── home/
    │   └── bin/
    │       └── launchp4merge@
    ├── nvim/
    │   └── .config
    │       └── nvim/
    │           ├── autoload/
    │           │   └── pathogen.vim
    │           ├── bundle/
    │           │   └── [...]
    │           └── init.vim
    ├── perl/
    │   ├── .perlcriticrc
    │   └── .perltidyrc
    ├── pip/
    │   └── .config
    │       └── pip
    │           └── pip.conf
    ├── tmux/
    │   └── .tmux.conf
    ├── vim/
    │   ├── .vim/
    │   │   ├── autoload/
    │   │   │   └── pathogen.vim
    │   │   └── bundle/
    │   │       └── [...]
    │   └── .vimrc
    └── zsh/
        ├── .fzf.zsh
        └── .zshrc
