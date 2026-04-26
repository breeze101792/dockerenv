#!/bin/bash
if test -f /tools/bootstrap.sh; then
    bash /tools/bootstrap.sh
fi
exec /bin/bash
