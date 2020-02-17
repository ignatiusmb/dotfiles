#!/bin/bash

LOGFILE="$(pwd)/install-packages-log.txt"

PACKAGES=(
  # essentials
  "zsh"
  "git"
  "curl"
  # python
  "python3.8"
  "python3-pip"
  # wsl + c++
  "build-essential"
  "gdb"
  # android
  "lib32z1"
  "openjdk-8-jdk"
  # tools
  "unzip"
  "zip"
)
for PKG in "${PACKAGES[@]}"; do
  sudo apt -y install $PKG
  if type -p $PKG >/dev/null; then
    echo "$PKG successfully installed" >>$LOGFILE
  else
    echo "$PKG failed to install!!" >>$LOGFILE
  fi
done

# zsh related
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting

# give vast colors to ls
wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O ~/.dircolors

# Change default shell to zsh
chsh -s $(which zsh)

### DEVELOPMENT ###
## SDK Manager
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
# Android
wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
unzip sdk-tools-linux-4333796.zip -d ~/development/Android
rm sdk-tools-linux-4333796.zip
# Flutter
FLUTTER_VERSION="https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.12.13+hotfix.8-stable.tar.xz"
wget $FLUTTER_VERSION -O flutter-sdk.tar.xz
tar xf flutter-sdk.tar.xz -C ~/development
rm flutter-sdk.tar.xz
# Gradle
sdk install gradle 5.5.1

# Installation Recap
echo -e "\n>---------- Summary ----------<\n"
cat $LOGFILE
echo -e "\nhttps://github.com/ignatiusmb/dotfiles\n"
rm $LOGFILE
