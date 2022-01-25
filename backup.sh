rsync -a ~/.vimrc .
rsync -a --exclude plugged ~/.vim .
git commit -a
git push
