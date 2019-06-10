#!/bin/bash

if [[ "$1" == "-y" ]]
then
  deploy
fi

read -p "Are you sure? Rewrite will occur" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  deploy
fi

deploy () {
  cp .gitconfig ~/.gitconfig
  cp .githelpers ~/.githelpers
  cp .zshrc ~/.zshrc
  cp .functions ~/.functions
  cp .psqlrc ~/.psqlrc
  mkdir -p .config/nvim && cp .config/nvim/init.vim ~/.config/nvim/init.vim
}
