# Convenience build file for running automated test suite,
# as well as generating completion sources.

# Copyright (C) 2021    Lucas Ritzdorf, Luca Zeuch

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.


# ----------------------------------------------------------------------------
#
# Setup
#
# This section contains variables for later use further down; it also
# auto-detects whether a program is installed or not. Due to this, we can skip
# targets if the required program for that target is not installed or not found.
#
# Because Windows is ~~weird~~ different, we need two branches for filling in
# the values.
#
# ----------------------------------------------------------------------------
PYTHON_PROG ?=
NVIM_PROG   ?=
VIM_PROG    ?=
GIT_PROG    ?=

ifeq ($(OS),WINDOWS_NT)
PYTHON_PROG := $(shell where python3)
NVIM_PROG   := $(shell where nvim)
VIM_PROG    := $(shell where vim)
GIT_PROG    := $(shell where git)
else
PYTHON_PROG := $(shell which python3)
NVIM_PROG   := $(shell which nvim)
VIM_PROG    := $(shell which vim)
GIT_PROG    := $(shell which git)
endif

PHONY :=

# ----------------------------------------------------------------------------
#
# General
#
# These targets are what you'll probably need the most.
#
# ----------------------------------------------------------------------------
# If make is invoked without any target provided, this will be our default
# target.
PHONY += help
help:
	@echo	'Cleaning:'
	@echo	'	clean		- Remove all dependencies located in `.bundle/`.'
	@echo	''
	@echo	'Development:'
	@echo	'	test		- Run test suite for Neovim and Vim.'
	@echo	'				  This target automatically skips Neovim and/or Vim'
	@echo	'				  if the respective program is not found.'
	@echo	'	test-vim	- Run test suite only for Vim.'
	@echo	'	test-nvim	- Run test suite only for Neovim.'
	@echo	''
	@echo	'Code Analysis:'
	@echo	'	lint		- Run linter on Vim script codebase,'
	@echo	'				  requires python3 and vim-vint module.'
	@echo	'	generate	- Create completion sources for nvim-cmp.'
	@echo	'				  Requires python3.'
	@echo	''
	@echo	'General:'
	@echo	'	all		- Run everything: test, lint, generate.'
	@echo	'	install		- Install this plugin as a manually installed plugin.'
	@echo	'				  Be careful, this target automagically prefers Neovim.'
	@echo	'				  To force Vim, please use `install-vim`.'
	@echo	'	install-vim	- Same as above, but ONLY try for Vim.'
	@echo	'	uninstall	- Uninstall this plugin from both Neovim and Vim.'
	@echo	'	help		- Print this help message. This is the default.'

PHONY += all
all: test lint generate

PHONY += clean
clean:
	rm -rf .bundle/

PHONY += install
install:
	@echo 'Installing plugin...'
	@echo 'Looking for Neovim...'
ifdef NVIM_PROG
	@echo 'Found Neovim, installing to ~/.local/share/nvim/site/pack/l-zeuch/start/yagpdb.vim'
	mkdir -p ~/.local/share/nvim/site/pack/l-zeuch/start/yagpdb.vim
	git clone https://github.com/l-zeuch/yagpdb.vim.git \
		~/.local/share/nvim/site/pack/l-zeuch/start/yagpdb.vim
	@echo 'Done.'
else ifdef VIM_PROG
	@echo 'Falling back to Vim...'
	@echo 'Installing to ~.vim/bundle/yagpdb.vim'
	mkdir -p ~/.vim/bundle/
	git clone https://github.com/l-zeuch/yagpdb.vim.git \
		~/.vim/bundle/yagpdb.vim
	@echo 'Done.'
	@echo 'Please remember to add the folder to your runtimepath:'
	@echo '	set runtimepath^=~/.vim/bundle/yagpdb.vim'
else
	$(error Neiter Neovim nor Vim found, aborting.)
endif

PHONY += install-vim
install-vim:
	@echo 'Installing plugin...'
	@echo 'Looking for Vim...'
ifdef VIM_PROG
	@echo 'Found Vim, installing to ~/.vim/bundle/yagpdb.vim'
	mkdir -p ~/.vim/bundle/
	git clone https://github.com/l-zeuch/yagpdb.vim.git \
		~/.vim/bundle/yagpdb.vim
	@echo 'Done.'
	@echo 'Please remember to add the folder to your runtimepath:'
	@echo '	set runtimepath^=~/.vim/bundle/yagpdb.vim'
else
	$(error No Vim installation found, aborting.)
endif

PHONY += uninstall
uninstall:
	@echo 'Uninstalling plugin...'
	-rm -rf ~/.vim/bundle/yagpb.vim
	-rm -rf ~/.local/share/nvim/site/pack/l-zeuch/start/yagpdb.vim
	@echo 'Done.'
	@echo 'If you have added this to your runtimepath, remember to remove it again.'

# ----------------------------------------------------------------------------
#
#  Development Targets
#
#  Usually these should already be run locally, before you even open any pull
#  request. However, for consistency reasons, these will also be executed as a
#  GitHub workflow, thus it is not *that* important if you don't run them.
#  However, please do.
#
# ----------------------------------------------------------------------------
PHONY += test
test: test-vim test-nvim

PHONY += test-vim
test-vim: .bundle/vader.vim
ifdef VIM_PROG
	@echo Found Vim installation, running tests...
	cd test/ && \
		$(VIM_PROG) -EsNu vimrc --not-a-term -c 'Vader! * */*'
else
	@echo Vim not found, skipping tests...
endif

PHONY += test-nvim
test-nvim: .bundle/vader.vim
ifdef NVIM_PROG
	@echo Found Neovim installation, running tests...
	cd test/ && \
		$(NVIM_PROG) -EsNu vimrc --headless -c 'Vader! * */*'
else
	@echo Neovim not found, skipping tests...
endif

# ----------------------------------------------------------------------------
#
# Code Analysis
#
# You should definitely run the lint target, or better yet, set up vint as the
# linter for Vim Script on your system.
# This target is also executed as a workflow -- linter warnings don't mean we
# won't accept your PR, but it does make us a little grumpy.
#
# The generate target is in general not necessary for opening a pull request --
# our workflow scans your code and determines if it is necessary to regenerate
# completion sources.
# However, it might be interesting to you.
#
# ----------------------------------------------------------------------------
PHONY += lint
lint:
ifdef PYTHON_PROG
	$(PYTHON_PROG) scripts/vint.py
else
	$(error python3 not found, skipping linter.)
endif

PHONY += generate
generate:
ifdef PYTHON_PROG
	$(PYTHON_PROG) scripts/gen_code_completion.py
else
	$(error python3 not found, aborting generation.)
endif

# ----------------------------------------------------------------------------
#
# Dependencies
#
# This section contains all dependencies you need to run the test suite.
# Currently, this is only vader.vim, a Vim script testing framework.
#
# You need not run this target directly, it a) has no use other than pulling the
# deps, and b) it's already a requirement for the test targets.
#
# ----------------------------------------------------------------------------

# We use this name for the dependency, so that make can determine whether it
# needs to be run or not. As make tracks the target name, and given it matches
# with the file name and said file already exists, make will not run it.
.bundle/vader.vim:
ifdef GIT_PROG
	$(GIT_PROG) clone --depth 1 https://github.com/junegunn/vader.vim.git \
		.bundle/vader.vim
else
	$(error git not found, aborting test suites.)
endif

# Evaluate all PHONY targets, i.e. which either don't match any file or don't
# generate any file output (generally both).
.PHONY: $(PHONY)
