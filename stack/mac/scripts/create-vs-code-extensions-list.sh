#!/bin/bash
set -euf -o pipefail

cd "$(dirname "$0")"
code --list-extensions | sort -f > "../templates/vs-code-extensions.txt"