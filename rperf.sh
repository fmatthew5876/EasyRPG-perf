#!/bin/bash

set -xe

sudo perf record --call-graph dwarf "$@"

