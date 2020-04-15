#!/bin/bash -eu

# Copyright 2018 MSA as unpublished work
# All Rights Reserved.
# The information contained herein is confidential property of MSA. The use,
# copying, transfer or disclosure of such information is prohibited except
# by express written agreement with MSA.
#
# Purpose
# This script installs development tools for the pink floyd development environment.

echo "==> Updating the system..."

apt-get -y update
apt-get -y upgrade

echo " => Done."

PACKAGES="\
  git \
  python \
  python3 \
  python-doc \
  python3-doc \
  python-pip \
  python3-pip \
  vim \
  nano \
  zip \
  unzip \
  tmux \
  curl \
  wget \
  mc \
  silversearcher-ag \
  git \
  git-lfs \
  dos2unix \
  net-tools \
"
echo "==> Installing development tools: ${PACKAGES}"

apt-get install -y ${PACKAGES}

echo " => Done."
