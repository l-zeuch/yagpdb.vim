# Python script to generate code completion sources for use with
# https://github.com/hrsh7th/nvim-cmp. Outputs lua code.
#
# Copyright (C) 2022    Lucas Ritzdorf, Luca Zeuch
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

import re
import os
from typing import Iterable

def gen_keyword_list(file) -> Iterable:
    p = re.compile(r'(?<=keyword yag)\w+\s+(.*?)(?=\s+contained$)', re.MULTILINE)
    with open(file) as f:
        matches = [match for line in f if (match := p.findall(line))]
        for sublist in matches:
            for item in sublist:
                yield from item.split()

def gen_completion(keywords) -> str:
        list = [f"\t\t\u007b label = '{keyword}' \u007d" for keyword in keywords]
        return ",\n".join(list)

def write_file(code):
    if "lua" not in os.listdir():
        try:
            os.mkdir('lua')
        except OSError as error:
            print(error)
            os._exit(1)

    with open('scripts/boilerplate.lua', "rt") as boilerplate, open('lua/yagpdbcc.lua', "wt") as fout:
        for line in boilerplate:
            fout.write(line.replace('---@@cmp-src@@', code))

def main():
    print("Generating sources...")

    path = r'syntax/'
    keywords = []

    files = [os.path.join(root, name) for root, _, files in os.walk(path)
            for name in files
            if name.endswith(".vim")]
    for f in files:
        keywords.extend(gen_keyword_list(f))

    keywords.sort()
    write_file(gen_completion(keywords))

    print("Done!")

if __name__ == "__main__":
    main()
