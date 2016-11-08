function clean-docker {
  docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
}

function hask {
  stack exec ghci
}

function retry {
  until !!; do :; done
}

function hostrun {
  ssh $HOSTMACHINE_USER@$HOSTMACHINE_IP -T -i ~/.ssh/devbox_rsa
}

function clip {
  read piped;
  echo "echo $piped | pbcopy" | hostrun
}

function true-colors {
  awk 'BEGIN{
  s="/\\/\\/\\/\\/\\"; s=s s s s s s s s s s s s s s s s s s s s s s s;
  for (colnum = 0; colnum<256; colnum++) {
    r = 255-(colnum*255/255);
    g = (colnum*510/255);
    b = (colnum*255/255);
    if (g>255) g = 510-g;
      printf "\033[48;2;%d;%d;%dm", r,g,b;
      printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
      printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
  }'
}

function fix-date-sync {
  sudo hwclock --systohc --localtime;
}

# Fuzzy CD
function cdf {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# Fuzzy edit file
function vf {
  nvim $(ag . | fzf | awk -F':' '{print $1}')
}

# Fuzzy Git Checkout
function gcf {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# Get Commit Sha
function gsf {
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
  echo -n $(echo "$commit" | sed "s/ .*//")
}
