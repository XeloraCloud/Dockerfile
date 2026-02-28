#!/bin/bash

echo "===== Container Starting ====="

# Show system info
echo "User: $(whoami)"
echo "Kernel: $(uname -r)"

# Start tmate session
echo "Starting tmate session..."
tmate -F
