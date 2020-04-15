#!/bin/bash

# Copyright 2018 MSA as unpublished work
# All Rights Reserved.
# The information contained herein is confidential property of MSA. The use,
# copying, transfer or disclosure of such information is prohibited except
# by express written agreement with MSA.

# Purpose
# This script sets up VIM.

echo "==> Setting up VIM..."

VIMRC="$HOME/.vimrc"

# Initialize VIM
if [ ! -f $VIMRC ]; then
  # Create the user settings file.
  cat <<EOT >> $VIMRC
" Highlight current line
:set cursorline

" Show line numbers
:set number

" Block cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
EOT

  # Download and install the file-line plugin, which allows for "vim <file>:<line>" syntax
  VIMPLUGINS="$HOME/.vim/plugin"
  FILELINE_PLUGIN="https://github.com/bogado/file-line.git"
  FILELINE_PATH="/tmp/file-line"
  git clone $FILELINE_PLUGIN $FILELINE_PATH
  mkdir -p $VIMPLUGINS/
  cp $FILELINE_PATH/plugin/* $VIMPLUGINS/

fi

echo " => Done."
