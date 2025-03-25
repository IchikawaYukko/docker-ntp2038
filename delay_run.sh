#!/bin/sh

# Wait chronyd daemon start
sleep 10

# Set time
chronyc settime `date +2035-%m-%d`

