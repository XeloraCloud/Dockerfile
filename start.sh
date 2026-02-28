#!/bin/bash

echo "===== Container Starting ====="

tmate &

sleep 5

tmate show-messages

echo "Container Ready..."

# Keep container alive
while true; do
    sleep 60
done
