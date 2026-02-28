#!/bin/bash

echo "===== Container Starting ====="

SOCKET="/tmp/tmate.sock"

echo "Starting tmate in debug mode..."

tmate -vv -S $SOCKET new-session -d 2>&1

sleep 10

echo "===== Session List ====="
tmate -S $SOCKET list-sessions 2>&1

echo "===== Ready Status ====="
tmate -S $SOCKET display -p '#{tmate_ready}' 2>&1

echo "===== SSH String ====="
tmate -S $SOCKET display -p '#{tmate_ssh}' 2>&1

echo "===== Done ====="

tail -f /dev/null
