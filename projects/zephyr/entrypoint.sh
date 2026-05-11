#!/bin/bash

## Run your bootstrap
if [ -f /tools/bootstrap.sh ]; then
    bash /tools/bootstrap.sh
fi

if [ -d ".venv-zephyr" ]; then
    source ".venv-zephyr/bin/activate"
fi

## The "Smart" Exec
if [ $# -gt 0 ]; then
    exec "$@"
else
    exec /bin/bash
fi
