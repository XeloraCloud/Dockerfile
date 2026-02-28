#!/bin/bash

echo "===== Container Starting ====="

SOCKET="/tmp/tmate.sock"

echo "Checking network..."
curl -I https://ssh.tmate.io || echo "Cannot reach ssh.tmate.io"

echo "Starting tmate..."
tmate -S $SOCKET new-session -d

sleep 10

echo "===== Debug Info ====="
tmate -S $SOCKET list-sessions || echo "No session created"

echo "===== Tmate SSH ====="
tmate -S $SOCKET display -p '#{tmate_ssh}' || echo "No SSH string"

echo "===== Tmate WEB ====="
tmate -S $SOCKET display -p '#{tmate_web}' || echo "No WEB string"

echo "===== Container Ready ====="

tail -f /dev/null
