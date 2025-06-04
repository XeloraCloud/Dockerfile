#!/bin/bash

tmate -F &

# Keep-alive trick for Railway
while true; do echo "💀 Alive..."; sleep 60; done
