#!/bin/bash

echo "==> Installing OH-MY-ZSH..."

# Clone Oh My Zsh from the git repo
rm -rf ~/.oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Copy the .zshrc
echo " -> Initializing ~/.zshrc..."
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# Set the agnoster theme. This requires the "" font to be installed.
echo " -> Setting AGNOSTER theme..."
sed -i "s/^\(ZSH_THEME\s*=\s*\).*$/\1agnoster/" ~/.zshrc


echo "  => Done."
