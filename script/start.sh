#!/bin/bash

soft-router start

CTRL_FIFO=/var/run/dnsmasq/ctl.fifo
if [ -e $CTRL_FIFO ]; then
	rm $CTRL_FIFO
fi
mkfifo $CTRL_FIFO
while true
do
	read a < $CTRL_FIFO
	if [ $a == "service dnsmasq restart" ]; then
		service dnsmasq restart
	fi
done

service dnsmasq start
