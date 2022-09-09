#!/usr/bin/env bash

# show file inodes
ls -i
# rm file(s) by inode
find . -inum ... -exec rm {} +

# Find sparse files
find / -type f -printf "%S\t%p\n" | gawk '$1 < 1.0 {print}'

# search line in and replace with new (multi-) line, preserving indentation,
# create backup file with suffix .bak
sed -i".bak" 's/^\(\s*\)#*.*KEY=\S\+/\1KEY=true\n\1KEY=true/'
