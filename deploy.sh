#!/bin/bash

deploy () {
  cp .gitconfig ~/.gitconfig
  cp .githelpers ~/.githelpers
  cp .zshrc ~/.zshrc
  cp .functions ~/.functions
  cp .psqlrc ~/.psqlrc
  mkdir -p .config/nvim && cp .config/nvim/init.vim ~/.config/nvim/init.vim
}

deploy
