# Python script to generate Vim Script syntax definitions.
#
# Copyright (C) 2024    Luca Zeuch, Lucas Ritzdorf
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

import os

def gen_code(funcs):
    code = ""
    for func in funcs:
        code += f"syn keyword yagFunc {func} contained\n"

    return code

def write_file(code, outfile):
    if "syntax" not in os.listdir():
        try:
            os.mkdir("syntax")
        except OSError as error:
            print(error)
            os._exit(1)

    # insert the header comment and append the code
    with open("scripts/comment.txt", "rt") as fin, open(outfile, "w+") as fout:
        fout.write(fin.read())
        fout.write("\n")
        fout.write(code)


def main():
    file = 'syntax/funcs'

    with open(file, "rt") as fin:
        funcs = [line.strip() for line in fin]

    code = gen_code(funcs)

    outfile = 'syntax/yagpdbcc/functions.vim'
    write_file(code, outfile)

    print("Generated syntax file for functions.")

if __name__ == "__main__":
    main()
