#!/bin/sh

# Exec chronyc after 10 sec of start daemon
./delay_run.sh &

exec "$@"

