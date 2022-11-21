#!/usr/bin/bash

echo "Starting test script..."

URL="44.211.103.126"
PORT=3000
TIMEOUT=10

RESULT=$(
	curl --include --silent --connect-timeout $TIMEOUT $URL:$PORT |
	head -n 1 |
	cut -d ' ' -f 2
)

printf "!${RESULT}!"
echo "new"
echo "!${RESULT}!"

if [ $RESULT -eq 200 ]; then
	echo "Online"
else
	echo "Offline"
fi
