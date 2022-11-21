#!/usr/bin/bash

echo "Starting test script..."
echo "SHELL=$SHELL"

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
    echo "Got '200 OK'"
	EXIT_CODE=0  # good
else
    echo "Got other value than '200 OK'"
fi

exit $EXIT_CODE
