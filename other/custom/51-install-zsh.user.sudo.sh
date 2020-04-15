#!/bin/bash

# Install ZSH
echo "==> Installing zsh..."
apt-get -y install zsh

# Set ZSH as default shell
echo " -> Set zsh as default shell..."
chsh -s $(which zsh) vagrant

# Install powerline fonts for the Agnoster theme (will be needed for oh-my-zsh setup)
echo " -> Set zsh as default shell..."
apt-get install -y fonts-powerline

echo " => Done."
