#!/bin/bash

echo "===== Container Starting ====="

SOCKET="/tmp/tmate.sock"

# Start detached session
tmate -S $SOCKET new-session -d

# Wait until ready
tmate -S $SOCKET wait tmate-ready

echo "===== Tmate Session Created ====="

# Print SSH connection string
tmate -S $SOCKET display -p '#{tmate_ssh}'

echo "===== Container Ready ====="

# Keep container alive
while true; do
    sleep 60
done
