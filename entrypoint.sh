#!/bin/sh

if [ $# -eq 0 ]; then
    echo "No args given. I will exit safely."
    echo "Please use --help to show pg_rman's help."
    exit 0
fi

pg_rman "$@"
