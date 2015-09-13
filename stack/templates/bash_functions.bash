h(){
  eval $(history | peco | awk '{print $2}')
}

cdf() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | peco) && cd "$dir"
}
