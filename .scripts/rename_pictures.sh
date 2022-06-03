#!/bin/bash

# FIXME This is WIP, do not use! Well there is an exit anyway.

verbose=false
dry=false
# TODO This doesn't properly set options to true if used!
while getopts n:v: option; do
  case "$option" in
    n)
      dry=true;;
    v)
      verbose=true;;
    *)
      echo "Unknown option $arg."
  esac
done
echo "options are: dry=$dry, verbose=$verbose"
exit

echo "Trying to rename ${#} files."
new_files=''
for p in ${@}; do
  if [[ ! $p =~ [0-9]{8}_[0-9]{6}[_0-9]*.jpg ]]; then # Already properly named
    new_name=$(exif -t 0x9003 $p | grep Value | awk '{printf("%s_%s.jpg",$2,$3)}' | sed 's/://g')
    if [ ! -z $new_name ]; then # non-empty exif data
      if [ -f $new_name ]; then
        echo "Duplicate file info, appending number to avoid same file name."
        for (( cnt=1; c<10; c++ )); do
          [ $cnt -eq 1 ] new_name="${new_name%.jpg}_$cnt.jpg" || new_name="${new_name%_[1-9].jpg}_$cnt.jpg"
          [ ! -f "$new_name" ] && break
        done
      fi
      [ $dry ] && new_files+=" $new_name" || mv -i "$p" "$new_name"
      [ $verbose ] && echo "Renaming file $p -> $new_name"
    fi
  else
    echo "Nothing to do for $p"
  fi
done
if dry; then
  echo 'Duplicates when run without -n option:'
  # uniq requires list to be ordered and checks lines, so spaces are translated to new-lines
  echo $new_files | tr '[ ]+' '\n' | sort | uniq -d
fi
