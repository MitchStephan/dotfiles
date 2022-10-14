# usage: try_src {filepath}
try_src() {
  [ -e "$1" ] && source $1
}

# usage: dkill {container name excerpt}
# example: dkill db
dkill() {
	docker ps -a -f status=running | grep $1 | awk '{ print $1 }' | xargs docker kill
}

# kill all running docker containers
dkillall() {
  docker ps -q | xargs docker kill
}

# https://github.com/sj14/epoch is a better version of this
ts() {
  date +"%s"
}

# macos date doesn't support milliseconds -- https://github.com/sj14/epoch is a better version of this
milli() {
  date +"%s000"
}

# usage: tsdate {unix timestamp}
# example: tsdate 1606857140
# https://github.com/sj14/epoch is a better version of this
tsdate() {
	date -u -r $1 +"%Y-%m-%d %H:%M:%S %Z"
}

# usage: millidate {millisecond timestamp}
# example: millidate 1605294533718
# https://github.com/sj14/epoch is a better version of this
millidate() {
	date -u -r $(( ($1 + 500) / 1000 )) +"%Y-%m-%d %H:%M:%S %Z" 
}

loop() {
  seconds=$1
  shift
  while true; do
    "$@"
    sleep $seconds
  done
}
