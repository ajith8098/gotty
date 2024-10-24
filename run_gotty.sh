#!/bin/bash

# Check if Gotty is installed, if not, install it
if ! [ -x "$(command -v gotty)" ]; then
  echo 'Gotty is not installed. Installing...'
  wget https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz
  tar -xvzf gotty_linux_amd64.tar.gz
  mv gotty /usr/local/bin/gotty
fi

# Start Gotty with unrestricted access
/usr/local/bin/gotty --permit-write --reconnect --port 8080 /bin/bash
