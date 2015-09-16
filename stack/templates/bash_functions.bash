h(){
  eval $(history | peco | awk '{print $2}')
}

cdf() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | peco) && cd "$dir"
}

clean-docker(){
  docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
}

hask(){
  ~/.ghci-color/ghci-color
}
