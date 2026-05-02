#!/bin/bash
if test -f /tools/bootstrap.sh; then
    bash /tools/bootstrap.sh
fi
if [ -d ".venv-zephyr" ]; then
    source ".venv-zephyr/bin/activate"
fi
exec /bin/bash
