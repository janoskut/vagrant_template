#!/bin/bash

# Install ZSH
echo "==> Installing zsh..."
apt-get -y install zsh

# Set ZSH as default shell
echo "--> Set zsh as default shell..."
chsh -s $(which zsh) vagrant

echo " => Done."
