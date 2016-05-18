#!/usr/bin/env bash

# make sure we are in the right directory
DIR="$( cd "$( dirname "$BASH_SOURCE}" )" && pwd )"
cd $DIR

# make sure we are up to date
git pull origin master

# install software
./brew.sh
./cask.sh

# change shell
grep -q '/usr/local/bin/zsh' /etc/shells || echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

if [ ! -e ~/.hammerspoon ]; then
  mkdir ~/.hammerspoon
fi

# link configs
ln -s $DIR/hammerspoon ~/.hammerspoon/init.lua
ln -s $DIR/zshrc ~/.zshrc
ln -s $DIR/vimrc ~/.vimrc

if [ ! -e ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

