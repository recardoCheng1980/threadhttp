#!/bin/sh
#$1 url
#$2 result file name
#$3 thread id
#$4 redirect url

resp=`curl -w%{http_code} -m1 -s -o $2 http://macauth.chengshihayng.com/macauth 2>/dev/null`

if [ "$?" != "0" ]; then
  echo "fail to exec curl: $4" >> /tmp/uhttpd_log/curl_error.$3
  exit -2
fi

if [ "$resp" != "200" ]; then
  echo "http resp code is not 200: $4" >> /tmp/uhttpd_log/curl_error.$3
  exit -1
fi

exit 0

