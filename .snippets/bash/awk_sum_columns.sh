#!/usr/bin/env bash
# Sum column in file where another column matches a regular expression

[[ $# -ne "4" ]] && echo "Error. Usage: $0 col_to_match regex col_to_sum file" && exit 2

awk_str=$(printf '$%s ~ /%s/ {sum += $%s} END {print sum}' "$1" "$2" "$3")
awk "${awk_str}" "${4}"
