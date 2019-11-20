INSTALL = install
INSTALL_D = $(INSTALL) -d
STOW = stow
STOW_FLAGS =

# dir Makefile is in aka this dotfiles repo
DOTFILES_DIR = $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

DIRS += $(HOME)/bin
DIRS += $(HOME)/.zshrc.d
DIRS += $(HOME)/.bashrc.d

STOW_PKGS += ack
STOW_PKGS += bash
STOW_PKGS += fish
STOW_PKGS += git
STOW_PKGS += hammerspoon
STOW_PKGS += home
STOW_PKGS += nvim
STOW_PKGS += perl
STOW_PKGS += pip
STOW_PKGS += rubocop
STOW_PKGS += tmux
STOW_PKGS += vim
STOW_PKGS += zsh

.PHONY : all dirs stow $(STOW_PKGS)

all : dirs stow

dirs : $(DIRS)

stow : dirs $(STOW_PKGS)

$(DIRS) :
	$(INSTALL_D) $(DIRS)

# execute stow for each dir (and ignore errors)
$(STOW_PKGS) :
	-stow -d $(DOTFILES_DIR) -t $(HOME) $@
