#!/usr/bin/env bash
echo "print last column of file"
awk '{print $(NF)}' file

echo "Sum column in file where another column matches a regular expression"
if [[ $# -ne "4" ]]; then
  echo "Error. Usage: $0 col_to_match regex col_to_sum file"
  exit 2
else
  awk_str=$(printf '$%s ~ /%s/ {sum += $%s} END {print sum}' "$1" "$2" "$3")
  awk "${awk_str}" "${4}"
fi

echo "Modify and print values in key-value pairs where key matches regex"
info=$(sudo blkid "/dev/$dev" | awk '{
  for(i=1;i<=NF;i++) {
      if(match($i,/\<UUID\>/) || match($i,/\<LABEL\>/)) {
        split($i,arr,/=/); print arr[2]}
      }
 awk '!/^$/{print $0}' myfile }' | tr -d '"')

# Filter out empty lines
awk '!/^$/{print $0}' myfile
