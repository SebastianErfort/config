#!/usr/bin/env bash
# NOTE: Untested, use at your own risk!

# FONTS
cd ~/.fonts
for a in $(ls *.zip); do
  unzip $a & # TODO Check parallelization, limit number of concurrent jobs
done
wait
