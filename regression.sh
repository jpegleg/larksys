#!/usr/bin/env bash

rundae () {
  ./larksys > regression.log 2>&1
}

killswitch () {
  pkill -9 larksys
}

rundae &
# do things here

# example max duration five minutes
sleep 300
killswitch
