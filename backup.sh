rsync -av ~/.vimrc .
rsync -av --exclude plugged ~/.vim .
git commit -a
git push
