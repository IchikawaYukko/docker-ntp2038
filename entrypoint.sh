#!/bin/sh
# If not set SERVER, set default source.
if [ -z "$SERVER" ]; then
  SERVER=pool.ntp.org
fi

# If not set OFFSET_YEAR, set difference from 2038.
if [ -z "$OFFSET_YEAR" ]; then
  OFFSET_YEAR=$(expr 2038 - $(date +%Y))
fi

# If not set OFFSET_DAYS, set 4. (Leap year count from 2025 to from 2038. (Year 2028, 2032, 2036))
if [ -z "$OFFSET_DAYS" ]; then
  OFFSET_DAYS=3
fi

echo Offsetting $OFFSET_YEAR year + $OFFSET_DAYS days
cp /etc/chrony/chrony.conf /etc/chrony/chrony.conf.org
sed -e "s/_OFFSET_SEC_/+$( expr \( $OFFSET_YEAR \* 365 + $OFFSET_DAYS \) \* 24 \* 60 \* 60)/" /etc/chrony/chrony.conf.org > /etc/chrony/chrony.conf.offset
sed -e "s/_SERVER_/$SERVER/" /etc/chrony/chrony.conf.offset > /etc/chrony/chrony.conf

# Exec chronyc after 10 sec of start daemon
./delay_run.sh &

exec "$@"

