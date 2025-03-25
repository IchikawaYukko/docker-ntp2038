#!/bin/sh

# Wait chronyd daemon start
sleep 10

# If not set NTP_YEAR, set 2038.
if [ -z "$NTP_YEAR" ]; then
  NTP_YEAR=2038
fi

# Set time
chronyc settime `date +$NTP_YEAR-%m-%d`

