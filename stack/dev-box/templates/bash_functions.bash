clean-docker(){
  docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
}

hask(){
  ~/.ghci-color/ghci-color
}

retry(){
  until !!; do :; done
}

hostrun(){
  args="$@"
  echo ${args} | ssh $HOSTMACHINE_USER@$HOSTMACHINE_IP -T -i ~/.ssh/devbox_rsa
}
