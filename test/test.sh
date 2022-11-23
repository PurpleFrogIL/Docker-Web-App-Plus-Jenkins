#!/usr/bin/bash

echo "Starting test script..."
echo "SHELL=$SHELL"

URL="44.211.103.126"
# PORT=3000
PORT=80
TIMEOUT=2


for i in {1..10}
do
    echo "Try number ${i}"
    RESULT=$(
        curl --include --silent --connect-timeout $TIMEOUT $URL:$PORT |
        head -n 1 |
        cut -d ' ' -f 2
    )

    if [[ $RESULT -eq 200 ]]; then
        echo "Got '200 OK'"
        exit 0  # good
    else
        echo "Got other value than '200 OK'"
        sleep 3
    fi
done

exit 1
