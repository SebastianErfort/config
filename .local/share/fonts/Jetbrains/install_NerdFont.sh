#!/usr/bin/bash
# NOTE: Untested, use at your own risk!
# Clone patched font with Nerd Font glpyhs/ligatures/icons from Github. Use subversion to download only this specific font from the git repo.
svn export https://github.com/ryanoasis/nerd-fonts/trunk/patched-fonts/JetBrainsMono/Ligatures
cd Ligatures
[ -d .svn ] && rm -rf .svn # clean up bloated subversion folder
find . -name "*Windows*" -exec rm {} + # delete windows-compatible fonts to save some disk space
[ ! -d ../ttf ] && mkdir ../ttf
mv */*/*.ttf ../ttf
fc-cache -f -v # update font cache to make font available
