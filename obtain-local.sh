#!/bin/bash

cp ~/.gitconfig .gitconfig
cp ~/.githelpers .githelpers
cp ~/.zshrc .zshrc
cp ~/.functions .functions
mkdir -p .config/nvim && cp ~/.config/nvim/init.vim .config/nvim/init.vim
cp ~/.psqlrc .psqlrc

