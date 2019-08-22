while true
do
  pid=`pgrep ab`
  kill -9 $pid
  sleep 5
done
