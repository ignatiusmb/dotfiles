#!/bin/bash

# shared dotfiles
PB_DFS=(
  ".bashrc"
  ".zshrc"
  ".zsh-filetype-highlighting"
  ".p10k.zsh"
)

# private dotfiles
PV_DFS=(
  ".gitconfig"
)

# Delete existing dot files and folders
for DF in "${PB_DFS[@]}"; do
  ln -sfv "$(pwd)/shared/$DF" ~/$DF
done
echo
for DF in ${PV_DFS[@]}; do
  ln -sfv "$(pwd)/private/$DF" ~/$DF
done

echo -e "\nhttps://github.com/ignatiusmb/dotfiles"
