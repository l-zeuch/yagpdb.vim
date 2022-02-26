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
import os
from io import StringIO

class StringBuilder:
    _file_str = None

    def __init__(self):
        self.file_str = StringIO()

    def Add(self, str):
        self.file_str.write(str)

    def __str__(self):
        return self.file_str.getvalue()

def gen_keyword_list(file) -> list:
    p = re.compile(r'(?<=keyword yagpdbcc)\w+\s+(.*?)(?=\s+contained$)', re.MULTILINE)
    with open(file) as f:
        matches = [match for line in f if (match := p.findall(line))]
        keywords = []
        for sublist in matches:
            for item in sublist:
                tmp = item.split()
                for keyw in tmp:
                    keywords.append(keyw)

    return keywords

def gen_completion(keywords) -> str:
    string_builder = StringBuilder()

    for keyword in keywords:
        string_builder.Add(f"\t\t\u007b label = '{keyword}' \u007d,\n")

    return string_builder.__str__()

def write_file(code):
    if not os.listdir().__contains__('lua'):
        try:
            os.mkdir('lua')
        except OSError as error:
            print(error)

    with open('scripts/boilerplate.lua', "rt") as boilerplate:
        with open('lua/yagpdbcc.lua', "wt") as fout:
            for line in boilerplate:
                fout.write(line.replace('---@@cmp-src@@', code))

def main():
    print("Generating sources...")

    path = r'syntax/yagpdbcc/'
    keywords = list()

    with os.scandir(path) as dirs:
        for entry in dirs:
            if entry.name.endswith('.vim'):
                keywords.append(gen_keyword_list(path + entry.name))

    # Flatten the keyword list again because calling the above twice causes a
    # nested list, which is undesirable.
    keywords = [keyword for keywords in keywords for keyword in keywords]
    write_file(gen_completion(keywords))

    print("Done!")

if __name__ == "__main__":
    main()
