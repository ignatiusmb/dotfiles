#!/bin/bash

LOGFILE="$(pwd)/install-packages-log.txt"

PACKAGES=(
  "zsh"
  "git"
  "curl"
  "python3.8"
  "python3-pip"
  "build-essential"
  "gdb"
)
for PKG in "${PACKAGES[@]}"; do
  sudo apt -y install $PKG
  if type -p $PKG >/dev/null; then
    echo "$PKG successfully installed" >>$LOGFILE
  else
    echo "$PKG failed to install!!" >>$LOGFILE
  fi
done

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting

wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O ~/.dircolors

# Change default shell to zsh
chsh -s $(which zsh)

# Installation Recap
echo -e "\n>---------- Summary ----------<\n"
cat $LOGFILE
echo -e "\nhttps://github.com/ignatiusmb/dotfiles\n"
rm $LOGFILE
