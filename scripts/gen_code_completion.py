# Python script to generate code completion sources for use with
# https://github.com/hrsh7th/nvim-cmp. Outputs lua code.

# Copyright (C) 2022    Lucas Ritzdorf, Luca Zeuch

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

import re

def gen_header():
    return """-- Code completion source file.
    -- Automatically generated. DO NOT EDIT.

    -- Copyright (C) 2022   Lucas Ritzdorf, Luca Zeuch

    -- This program is free software; you can redistribute it and/or modify
    -- it under the terms of the GNU General Public License as published by
    -- the Free Software Foundation; either version 2 of the License, or
    -- (at your option) any later version.
    -- This program is distributed in the hope that it will be useful,
    -- but WITHOUT ANY WARRANTY; without even the implied warranty of
    -- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    -- GNU General Public License for more details.

    -- You should have received a copy of the GNU General Public License along
    -- with this program; if not, write to the Free Software Foundation, Inc.,
    -- 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

    local source = {}
    """

def gen_keyword_pattern():
    return """

    --- Just match any word inside the braces, the rest will be done
    --- by matching against the keywords.
    function source:get_keyword_pattern()
        return [[{{(%s+)}}]]
    end
    """

def parse_keywords(file):
    p = re.compile(r'(?<=keyword yagpdbcc)\w+\s+(.*?)(?=\s+contained$)', re.MULTILINE)
