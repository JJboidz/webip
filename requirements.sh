#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run with: sudo $0"
    exit 1
fi

if [ -n "$SUDO_USER" ]; then
    USER_HOME="/home/$SUDO_USER"
else
    USER_HOME="$HOME"
fi

apt update || { exit 1; }

SOURCE_FILE="$USER_HOME/webip/webip.sh"
DEST_FILE="/usr/local/bin/webip"

if [ ! -f "$SOURCE_FILE" ]; then
    exit 1
fi

mv "$SOURCE_FILE" "$DEST_FILE" || exit 1
chmod +x "$DEST_FILE"

echo ""
echo "You can now run the script with 'webip <URL>' in any directory."
