#!/bin/bash

echo "===== Container Starting ====="

SOCKET="/tmp/tmate.sock"

tmate -S $SOCKET new-session -d

sleep 15

echo "===== Tmate SSH ====="
tmate -S $SOCKET display -p '#{tmate_ssh}'

echo "===== Tmate WEB ====="
tmate -S $SOCKET display -p '#{tmate_web}'

echo "===== Container Ready ====="

tail -f /dev/null
