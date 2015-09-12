export TERM=xterm-256color
export BASH_IT="$HOME/.bash_it"
export BASH_IT_THEME='minimal'

EDITOR=vim # Of course
export EDITOR

export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export LC_ALL="en_AU.UTF-8"
export LC_CTYPE="en_AU.UTF-8"

# Pretty Dircolors
eval `dircolors ~/.dircolors`

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.bin/tmuxinator.bash ]; then
  . ~/.bin/tmuxinator.bash
fi

#Go
export PATH="/usr/local/go/bin:$PATH"
export GOPATH="/code/go"
export PATH=$PATH:$GOPATH/bin

#Haskell
export PATH="$PATH:$HOME/.cabal/bin"

# Chruby
if [ -f /usr/local/share/chruby/chruby.sh ]; then
  source /usr/local/share/chruby/chruby.sh
fi

if [ -f /usr/local/share/chruby/auto.sh ]; then
  source /usr/local/share/chruby/auto.sh
fi

# Bash Profile
if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi

# Bash It
source $BASH_IT/bash_it.sh
