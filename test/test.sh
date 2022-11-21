#!/usr/bin/bash

echo "Starting test script..."

URL="44.211.103.126"
PORT=3000
TIMEOUT=10
EXIT_CODE=1  # bad

RESULT=$(
	curl --include --silent --connect-timeout $TIMEOUT $URL:$PORT |
	head -n 1 |
	cut -d ' ' -f 2
)

if [[ $RESULT -eq 200 ]]; then
	EXIT_CODE=0  # good
fi

exit $EXIT_CODE
