#!/bin/bash


PACKAGES=(
  # essentials
  "apt-transport-https"
  "curl"
  "git"
  "zsh"
  # tools
  "unzip"
  "zip"
  # python
  "python3.8"
  "python3-pip"
  # wsl + c++
  "build-essential"
  "gdb"
)
sudo apt update && sudo apt upgrade -qy
for PKG in "${PACKAGES[@]}"; do
  sudo apt -qy install $PKG
  if type -p $PKG >/dev/null; then
    echo "$PKG successfully installed"
  else
    echo "$PKG failed to install!!"
  fi
done

# zsh related
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting

# give vast colors to ls
curl https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -o ~/.dircolors

# Change default shell to zsh
chsh -s $(which zsh)

### DEVELOPMENT ###
# nvm + NodeJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
nvm install node


sudo apt update && sudo apt upgrade -qy
echo -e "\nhttps://github.com/ignatiusmb/dotfiles\n"
