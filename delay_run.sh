#!/bin/sh

# Wait chronyd daemon start
sleep 10

# Show server status
chronyc tracking|grep "Ref time"
chronyc sources

