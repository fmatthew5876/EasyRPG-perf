#!/bin/bash

set -xe

name=$1

oscript="$name.script"
oflat="$name.flat"
osvg="$name.svg"
opng="$name.png"


if [ -z "$name" ]; then
	echo "No name"
	exit 1
fi

sudo perf script > "$oscript"
cat "$oscript" | ./FlameGraph/stackcollapse-perf.pl > "$oflat"
cat "$oflat" | ./FlameGraph/flamegraph.pl > "$osvg"
inkscape "$osvg" -e "$opng" --without-gui

