#!/usr/bin/bash

echo "Starting test script..."

RESULT=$(curl --include --silent --connect-timeout 10 44.211.103.126:3000 | head -n 1 | cut -d ' ' -f 2)

printf "!${RESULT}!"
echo "new"
echo "!${RESULT}!"

if [ $RESULT -eq 200 ]; then
	echo "Online"
else
	echo "Offline"
fi
