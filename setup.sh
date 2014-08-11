#/bin/bash

# This assumes the directory structure /home/user/DotFiles/

# Move into the home directory
cd ../
ln -s DotFiles/.bashrc .bashrc
ln -s DotFiles/.vimrc .vimrc
ln -s DotFiles/.vim .vim
ln -s DotFiles/.tmux.conf .tmux.conf
ln -s DotFiles/.gitconfig .gitconfig