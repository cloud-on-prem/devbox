EDITOR=nvim # Of course
set -o vi
export TERM=xterm-256color
export BASH_IT="$HOME/.bash_it"
export EDITOR
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export LC_ALL="en_AU.UTF-8"
export LC_CTYPE="en_AU.UTF-8"
export PATH="/usr/local/sbin:$PATH"

# FZF
FZF_TMUX=0
export FZF_DEFAULT_OPTS='
  --color=dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
  --color info:254,prompt:37,spinner:108,pointer:235,marker:235
'
export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#Go
export PATH="/usr/local/go/bin:$PATH"
export GOPATH="{{ workspace_dir }}/go"
export PATH=$PATH:$GOPATH/bin
export GO15VENDOREXPERIMENT=1

#Haskell
export PATH="$PATH:$HOME/.cabal/bin"

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
  for f in ~/.bash-my-aws/lib/*-functions; do source $f; done
  eval "$(~/.bash-my-aws/bin/generate_bash_completion)"
fi
