# Convenience build file for running automated test suite.

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

# Targets which do not create an output file
.PHONY: test clean

test: .bundle/vader.vim
	cd test && vim -EsNu vimrc --not-a-term -c 'Vader! * */*'

clean:
	rm -rf .bundle/

# Dependencies
.bundle/vader.vim:
	git clone --depth 1 https://github.com/junegunn/vader.vim.git \
		.bundle/vader.vim
