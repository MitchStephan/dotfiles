# usage: dkill {container name excerpt}
# example: dkill db
dkill() {
	docker ps -a -f status=running | grep $1 | awk '{ print $1 }' | xargs docker kill
}

# (epoch has better version of this)
ts() {
  date +"%s"
}

# macos date doesn't support milliseconds (epoch has better version of this)
milli() {
  date +"%s000"
}

# usage: tsdate {unix timestamp}
# example: tsdate 1606857140
# (epoch has better version of this)
tsdate() {
	date -u -r $1 +"%Y-%m-%d %H:%M:%S %Z"
}

# usage: millidate {millisecond timestamp}
# example: millidate 1605294533718
# (epoch has better version of this)
millidate() {
	date -u -r $(( ($1 + 500) / 1000 )) +"%Y-%m-%d %H:%M:%S %Z" 
}
