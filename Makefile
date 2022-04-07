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

all: test generate

test: test-vim test-nvim

generate:
ifdef PYTHON_PROG
	$(PYTHON_PROG) scripts/gen_code_completion.py
else
	$(error python3 not found, aborting generation.)
endif

test-vim: .bundle/vader.vim
ifdef VIM_PROG
	@echo Found Vim installation, running tests...
	cd test/ && \
	$(VIM_PROG) -EsNu vimrc --not-a-term -c 'Vader! * */*'
else
	@echo Vim not found, skipping tests...
endif

test-nvim: .bundle/vader.vim
ifdef NVIM_PROG
	@echo Found Neovim installation, running tests...
	cd test/ && \
	$(NVIM_PROG) -EsNu vimrc --headless -c 'Vader! * */*'
else
	@echo Neovim not found, skipping tests...
endif

.bundle/vader.vim:
ifdef GIT_PROG
	$(GIT_PROG) clone --depth 1 https://github.com/junegunn/vader.vim.git \
		.bundle/vader.vim
else
	$(error git not found, aborting test suites.)
endif

clean:
	rm -rf .bundle/

.PHONY: clean test test-nvim test-vim
