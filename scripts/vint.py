# Script to convert Vint's Linter warnings to valid GitHub warning or error
#
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

import json
import shutil
import subprocess
import sys

# Generate our vint command and fail if the executable is not found.
def generate_command():
    exe = shutil.which("vint")

    if not exe:
        print("No vint executable found. Install it with pip install vim-vint.")
        sys.exit(1)

    return [exe, "--json", "."]

def generate_github_output(issues):
    # Map Vint's levels to GitHub's message levels.
    LEVEL_MAPPING = {"error": "error", "warning": "warning", "style_problem": "notice"}

    for issue in issues:
        level = issue.get('severity')
        message = f"{issue.get('description')}. See {issue.get('reference')}."
        path = issue.get('file_path')
        line = issue.get('line_number')
        column = issue.get('column_number')

        if level in LEVEL_MAPPING:
            print(f"::{LEVEL_MAPPING[level]} file={path},line={line},col={column}::{message}")

        else:
            print(f"--- INFO: Unknown level {level}")

    if issues:
        sys.exit(1)

# Run our generated command and give back our output.
def get_vint_output():
    command = generate_command()
    print("--- COMMAND: ", command)

    try:
        process = subprocess.Popen(command, stdout = subprocess.PIPE)
        output = process.communicate()[0]
        process.wait()

        return output

    except subprocess.CalledProcessError as e:
        print("Error in calling Vint: ", e.output)
        return None
    except:
        print("Unexpected error:", sys.exc_info()[0])
        return None

def process_output(output):
    try:
        issues = json.loads(output)

        generate_github_output(issues)

    except (AttributeError, ValueError):
        print("Failed loading JSON...")

def main():
    output = get_vint_output()

    if not output:
        print("No violations found.")
        sys.exit(0)

    process_output(output)

if __name__ == "__main__":
    main()
