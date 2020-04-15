#!/bin/bash

# Copyright 2018 MSA as unpublished work
# All Rights Reserved.
# The information contained herein is confidential property of MSA. The use,
# copying, transfer or disclosure of such information is prohibited except
# by express written agreement with MSA.
#
# Purpose
# This script sets up GIT.

echo "==> Setting up GIT..."

# Git aliases
git config --global alias.co  "checkout"
git config --global alias.br  "branch"
git config --global alias.ci  "commit"
git config --global alias.st  "status"
git config --global alias.sm  "submodule"
git config --global alias.smu "submodule update"
git config --global alias.smi "submodule update --init --recursive"
git config --global alias.fe  "fetch -ap"

# Generate SSH keys and copy public key to host
SSH_PRV_KEY="${HOME}/.ssh/id_rsa"
SSH_PUB_KEY="${SSH_PRV_KEY}.pub"
HOST_SHARE="${HOME}/host/"
HOST_PUB_KEY="${HOST_SHARE}/pf_vagrant-id_rsa.pub"
if [ ! -f ${SSH_PRV_KEY} ]; then
  ssh-keygen -f ${SSH_PRV_KEY} -t rsa -N ''
  # Copy SSH pub key to host
  cp ${SSH_PUB_KEY} ${HOST_PUB_KEY}
fi

# Setup line endings to linux style
git config --global core.autocrlf input
git config --global pager.branch false

echo " => Done."
