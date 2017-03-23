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
{% if guest_machine %}
export HOSTMACHINE_IP="{{ hostmachine_ip_raw.stdout }}"
export HOSTMACHINE_USER="{{ hostmachine_user }}"
{% endif %}

# FZF
export FZF_TMUX=0
export FZF_DEFAULT_OPTS='--color 16'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
. ~/.fzf.bash 2> /dev/null

#Go
export PATH="/usr/local/go/bin:$PATH"
export GOPATH="{{ workspace_dir }}/go"
export PATH=$PATH:$GOPATH/bin
export GO15VENDOREXPERIMENT=1

#Haskell
export PATH="$HOME/.stack/programs/x86_64-linux/ghc-7.10.3/bin/:$PATH" # Add Haskell path
export PATH="$HOME/.local/bin:$PATH" # Add Stack bins

# Chruby
export PATH="/home/vagrant/.gem/ruby/{{ ruby_version }}/bin/:$PATH";
. /usr/local/share/chruby/chruby.sh 2> /dev/null
. /usr/local/share/chruby/auto.sh 2> /dev/null

# Node
export NVM_DIR="$HOME/.nvm"
. "$NVM_DIR/nvm.sh" 2> /dev/null

# Load stuff without moaning

{% if ansible_distribution == 'MacOSX' %}
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
{% endif %}
{% if ansible_distribution == 'Fedora' %}
[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
{% endif %}

. ~/.bash_functions 2> /dev/null
. ~/.bash_aliases 2> /dev/null
. ~/.bin/tmuxinator.bash 2> /dev/null
. "$BASH_IT/bash_it.sh"
. ~/.context_bashrc 2> /dev/null
. ~/.bash_prompt 2> /dev/null

# Bash My Aws
BASH_MY_AWS_DIR=~/.bash-my-aws
if [ -d BASH_MY_AWS_DIR ]; then
  for f in $BASH_MY_AWS_DIR/lib/*-functions; do . $f; done
  . $BASH_MY_AWS_DIR/bash_completion.sh
fi

unalias tree 2> /dev/null # use real tree
