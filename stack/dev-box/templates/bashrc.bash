EDITOR=nvim # Of course
set -o vi
export BASH_IT="$HOME/.bash_it"
export EDITOR
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export WORKSPACE="{{ workspace_dir }}"
export LC_ALL="en_AU.UTF-8"
export LC_CTYPE="en_AU.UTF-8"
export PATH="/usr/local/sbin:$PATH"
export ANSIBLE_NOCOWS=1
{% if guest_machine is defined %}
  export HOSTMACHINE_IP="{{ hostmachine_ip_raw.stdout }}"
  export HOSTMACHINE_USER="{{ hostmachine_user }}"
{% endif %}

# FZF
FZF_TMUX=0
export FZF_DEFAULT_OPTS='--color 16'
export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#Go
export PATH="/usr/local/go/bin:$PATH"
export GOPATH="{{ workspace_dir }}/go"
export PATH=$PATH:$GOPATH/bin
export GO15VENDOREXPERIMENT=1

#Haskell
export PATH="$HOME/.stack/programs/x86_64-linux/ghc-7.10.3/bin/:$PATH" # Add Haskell path
export PATH="$HOME/.local/bin:$PATH" # Add Stack bins

# Chruby
source /usr/local/share/chruby/chruby.sh 2> /dev/null
source /usr/local/share/chruby/auto.sh 2> /dev/null

# Load stuff without moaning
source ~/.bash_functions 2> /dev/null
source ~/.bash_aliases 2> /dev/null
source ~/.bin/tmuxinator.bash 2> /dev/null
source $BASH_IT/bash_it.sh
source ~/.context_bashrc 2> /dev/null
source ~/.bash_prompt 2> /dev/null

# Bash My Aws
BASH_MY_AWS_DIR=~/.bash-my-aws
if [ -d BASH_MY_AWS_DIR ]; then
  for f in $BASH_MY_AWS_DIR/lib/*-functions; do source $f; done
  source $BASH_MY_AWS_DIR/bash_completion.sh
fi
