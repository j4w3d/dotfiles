#!/bin/bash
#
#

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export BASH_DIR=~/.bash

source $BASH_DIR/aliases
source $BASH_DIR/functions
source $BASH_DIR/variables
source $BASH_DIR/bash_profile

# Add tab completion for many Bash commands
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion;
fi;

# Local config
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local

[ -n "$PS1" ] && source ~/.bash_profile;
