#!/bin/bash
NGINX="/usr/local/nginx/sbin/nginx"
NGINXPIDFILE="/tmp/nginx.pid"
NGINXCONFIG="/usr/local/etc/nginx/nginx.conf"

if [ $# = 0 ]; then
	echo "Valid commands: "
        echo "start | stop | restart"
	exit 1
fi
	
if [ $1 = "start" ]; then
	if [ ! -f $NGINX ]; then
		echo "nginx executable not found"
		exit 2
	fi
	echo "Starting nginx ..."
	sudo $NGINX -c $NGINXCONFIG
	echo "Done!"
elif [ $1 = "stop" ]; then
	if [ ! -f $NGINXPIDFILE ]; then
                echo "nginx is not running"
                exit 3
        fi
	echo "Stopping nginx ..."
	sudo kill `cat $NGINXPIDFILE`
	echo "Done!"
elif [ $1 = "restart" ]; then
	$0 stop
	$0 start
else
	echo "Valid commands: "
	echo "start | stop | restart"
fi
