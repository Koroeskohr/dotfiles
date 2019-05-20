#!/bin/bash

read -p "Are you sure? Rewrite will occur" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  cp .gitconfig ~/.gitconfig
  cp .githelpers ~/.githelpers
  cp .zshrc ~/.zshrc
  cp .functions ~/.functions
  cp .psqlrc ~/.psqlrc
  cp init.vim ~/.config/nvim/init.vim
fi
