#!/bin/bash

set -xe

pid=$(pgrep easyrpg-player)
if [ -z "$pid" ]; then
	echo "No process id"
	exit 1
fi
sudo perf record --call-graph dwarf -p ${pid}

