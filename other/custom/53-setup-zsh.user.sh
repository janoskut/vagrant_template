#!/bin/bash

echo "==> Setup .zshrc..."


echo " -> Adding .zshrc.local hook"
cat <<EOT >> ~/.zshrc
# Use a different file for aliases
if [ -f ~/.zshrc.local ]; then
source ~/.zshrc.local
fi
EOT


echo "  => Done."
