#!/bin/bash

# shared dotfiles
PB_DFS=(
  ".bashrc"
  ".p10k.zsh"
  ".zshrc"
  ".zsh-filetype-highlighting"
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
  TARGET="$(pwd)/private/$DF"
  DEST="$HOME/$DF"
  if [ -d $TARGET ]; then
    if [ -L $DEST ]; then
      rm $DEST
    fi
    ln -sdfv $TARGET ~/$DF
  else
    ln -sfv $TARGET ~/$DF
  fi
done

echo -e "\nhttps://github.com/ignatiusmb/dotfiles"
