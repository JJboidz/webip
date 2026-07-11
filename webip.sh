#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: webip <URL>"
	exit 1
fi

URL="$1"

while true; do
	curl -s "$URL" > /dev/null && break
	echo "Website Not Found..."
	sleep 2
done

WEBSITE=$(echo "$URL" | sed -e 's|http[s]*://||' -e 's|/.*||')
IP=$(dig +short "$WEBSITE" | head -1)

echo "$IP"
