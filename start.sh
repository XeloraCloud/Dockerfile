#!/bin/bash

echo "===== Container Starting ====="

PORT=${PORT:-8080}

echo "Starting ttyd on port $PORT"

ttyd -p $PORT -W bash

echo "===== Container Ready ====="
