# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

PS1="\w > "

test -s ~/.alias && . ~/.alias || true

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.local/share/../bin/env"

export PATH=${PATH}:/usr/local/cuda-13.1/bin
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda-13.1/lib64

export PATH=${PATH}:/usr/local/llama.cpp/bin
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib64

alias venv="source .venv/bin/activate"

eval "$(starship init bash)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
