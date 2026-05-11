#!/bin/bash

## Run your bootstrap
if [ -f /tools/bootstrap.sh ]; then
    bash /tools/bootstrap.sh
fi

## The "Smart" Exec
if [ $# -gt 0 ]; then
    exec "$@"
else
    exec /bin/bash
fi
