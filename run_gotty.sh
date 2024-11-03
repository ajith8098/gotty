#!/bin/bash

# Check if Gotty is installed, if not, install it
if ! command -v gotty &> /dev/null; then
  echo 'Gotty is not installed. Installing...'
  wget -q https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz
  tar -xzf gotty_linux_amd64.tar.gz
  mv gotty /usr/local/bin/gotty
  rm gotty_linux_amd64.tar.gz
  echo 'Gotty installation complete.'
else
  echo 'Gotty is already installed.'
fi

# Start Gotty with unrestricted access on port 8080
echo 'Starting Gotty...'
/usr/local/bin/gotty --permit-write --reconnect --port 8080 /bin/bash
