#!/usr/bin/env bash

# Find sparse files
find / -type f -printf "%S\t%p\n" | gawk '$1 < 1.0 {print}'
