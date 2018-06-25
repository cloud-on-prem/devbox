export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -a '' -c" # Of course
set -o vi

# History
export HISTIGNORE="c:clear:ls" # Ignore common commands
export HISTSIZE=
export HISTFILESIZE=

export BASH_IT="$HOME/.bash_it"
export EDITOR
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export WORKSPACE="{{ workspace_dir }}"
export LC_ALL="en_AU.UTF-8"
export LC_CTYPE="en_AU.UTF-8"
export PATH="/usr/local/sbin:$PATH"
export ANSIBLE_NOCOWS=1

# FZF
export FZF_TMUX=0
export FZF_DEFAULT_OPTS='--color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81 --color info:144,prompt:161,spinner:135,pointer:135,marker:118'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
. ~/.fzf.bash 2> /dev/null

#Haskell
export PATH="$HOME/.stack/programs/x86_64-linux/ghc-7.10.3/bin/:$PATH" # Add Haskell path
export PATH="$HOME/.local/bin:$PATH" # Add Stack bins

# Chruby
export PATH="$HOME/.gem/ruby/{{ ruby_version }}/bin/:$PATH";
. /usr/local/share/chruby/chruby.sh 2> /dev/null
. /usr/local/share/chruby/auto.sh 2> /dev/null

# Node
export NVM_DIR="$HOME/.nvm"
. "$NVM_DIR/nvm.sh" 2> /dev/null
export PATH="$HOME/.config/yarn/global/node_modules/.bin/:$PATH" # Add Yarn Global bins

# Load stuff without moaning

. ~/.bash_functions 2> /dev/null
. ~/.bash_aliases 2> /dev/null
. ~/.bin/tmuxinator.bash 2> /dev/null
. "$BASH_IT/bash_it.sh"
. ~/.context_bashrc 2> /dev/null
. ~/.bash_prompt 2> /dev/null

unalias tree 2> /dev/null # use real tree
