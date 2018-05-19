#!/bin/bash

soft-router stop

CTRL_FIFO=/var/run/dnsmasq/ctl.fifo
if [ -e $CTRL_FIFO ]; then
	rm $CTRL_FIFO
fi

service dnsmasq stop