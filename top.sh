while true
do
  top -b -n1 | grep uhttpd >> ./top.txt
  sleep 2
done
