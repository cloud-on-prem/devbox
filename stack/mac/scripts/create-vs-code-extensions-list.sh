#!/bin/bash
set -euf -o pipefail

cd "$(dirname "$0")"
code --list-extensions > "../templates/vs-code-extensions.txt"