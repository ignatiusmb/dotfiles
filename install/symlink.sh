#!/bin/bash

DOTFILES=(
  "bashrc"
  "zshrc"
  "zsh-filetype-highlighting"
  "p10k.zsh"
)

echo -e "\n>---------- Symbolic Links ----------<\n"

# Delete existing dot files and folders
for DF in "${DOTFILES[@]}"; do
  sudo rm -rf ~/.$DF >/dev/null 2>&1
  ln -sfv "$(pwd)/shared/$DF" ~/.$DF
done

echo -e "\nhttps://github.com/ignatiusmb/dotfiles\n"
