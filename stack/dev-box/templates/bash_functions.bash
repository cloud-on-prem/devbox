clean-docker(){
  docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
}

hask(){
  ~/.ghci-color/ghci-color
}

retry(){
  until !!; do :; done
}
