#!/bin/sh
spawn-fcgi -p 8080 -n /mini_server &
sleep 1
exec /docker-entrypoint.sh nginx -g "daemon off;"