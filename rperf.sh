#!/bin/bash

set -xe

name=$1
if [ -z "$name" ]; then
	echo "Must specify name"
	exit 1
fi
shift

sudo perf record --call-graph dwarf "$@"
./sperf.sh "$name"

