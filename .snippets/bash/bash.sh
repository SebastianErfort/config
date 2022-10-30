#!/usr/bin/env bash

# === FILES & DIRECTORIES
# show file inodes
ls -i
# rm file(s) by inode
find . -inum ... -exec rm {} +
# Find sparse files
find / -type f -printf "%S\t%p\n" | gawk '$1 < 1.0 {print}'

# === VARIABLES
# Variable expansion
fname=john
john=thomas
echo ${!fname} # returns thomas

# === FUNCTIONS
# show/print function definition
declare -f function_name

# === CONFIG
set -v # Print shell input lines as they are read.
set -x # Print commands and their arguments as they are executed.

