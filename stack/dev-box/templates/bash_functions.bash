clean-docker(){
  docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
}

hask(){
  stack exec ghci
}

retry(){
  until !!; do :; done
}

hostrun(){
  args="$@"
  echo ${args} | ssh $HOSTMACHINE_USER@$HOSTMACHINE_IP -T -i ~/.ssh/devbox_rsa
}
