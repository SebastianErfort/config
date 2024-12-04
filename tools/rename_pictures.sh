#!/usr/bin/env bash

rename_pictures () {
  # FIXME: This is WIP, do not use! Well there is an exit anyway.
  
  local verbose=false dry=false
  # TODO This doesn't properly set options to true if used!
  while getopts n:v: option; do
    case "$option" in
      n)
        shift
        dry=true
        ;;
      v)
        shift
        verbose=true
        ;;
      *)
        echo "Unknown option $arg."
    esac
  done
  echo "Running with options dry=$dry, verbose=$verbose"
  
  echo "Attempting to rename ${#} files."
  local -a new_files
  for p in "$@"; do
    ext=".${p##*.}"
    if [[ ! $p =~ [0-9]{8}_[0-9]{6}[_0-9]*${ext} ]]; then # Already properly named
      new_name="$(exif::datetime "$p")${ext}" ||
        { echo "Failed to retrieve EXIF data for ${p} - skipping"; continue; }
      echo "$p : $ext, $new_name"
      if [[ -n "$new_name" ]]; then # non-empty exif data
        if [[ -f "$new_name" ]]; then
          echo "Duplicate file ${p}, appending number"
          for (( cnt=1; c<10; c++ )); do
            [[ $cnt -eq 1 ]] &&
                new_name="${new_name%${ext}}_${cnt}${ext}" ||
                new_name="${new_name%_[1-9].jpg}_${cnt}${ext}"
            [[ ! -f "$new_name" ]] && break
          done
        fi
        $dry &&
            { new_files+="$new_name"; echo mv -i "$p" "$new_name"; } ||
            mv -i "$p" "$new_name"
        $verbose && echo "Renaming file $p -> $new_name"
      fi
    else
      $verbose && echo "Nothing to do for $p"
    fi
  done
}

exif::datetime () {
  exiftool -common -csv "$@" | awk -F, 'NR>1 {print $5}' | tr ' ' ':' | awk -F: -vOFS="-" '{print $1 $2 $3, $4 $5 $6}'
}

if [[ "$0" == "${BASH_SOURCE[0]}" ]]; then
    rename_pictures "$@"
fi
