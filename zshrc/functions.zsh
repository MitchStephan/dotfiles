# usage: try_src {filepath}
try_src() {
  [ -e "$1" ] && source $1
}

# kill all running docker containers
dkillall() {
  docker ps -q | xargs docker kill
}

loop() {
  seconds=$1
  shift
  while true; do
    "$@"
    sleep $seconds
  done
}
