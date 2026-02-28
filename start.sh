#!/bin/bash

exec /sbin/init

echo "===== Container Starting ====="

# Install sshx
curl -sSf https://sshx.io/get | sh

echo "===== Starting sshx Session ====="

# Start interactive sshx session
sshx

echo "===== Session Started ====="

# Keep container alive
tail -f /dev/null
