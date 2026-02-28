#!/bin/bash

echo "===== Container Starting ====="

SOCKET="/tmp/tmate.sock"

# Start detached session
tmate -S $SOCKET new-session -d

# Give it time to initialize
sleep 10

echo "===== Tmate Info ====="

tmate -S $SOCKET display -p '#{tmate_ssh}' 2>/dev/null
tmate -S $SOCKET display -p '#{tmate_web}' 2>/dev/null

echo "===== Container Ready ====="

# Keep container alive
tail -f /dev/null
