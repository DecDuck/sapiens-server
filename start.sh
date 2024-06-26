#!/bin/bash

# Script for starting the server.  Its purpose is to start the server and automatically
# restart it if a non-zero argument is returned on exit, implying a crash.  This approach isn't 
# bulletproof but it works pretty good.

# Import your configuration
source config.sh

cd $GAME_DIR

while true; do
    # Start the server with the world name passed when starting the script.  If you need to modify
    # any of the server arguments you can do it here.
    ./linuxServer --load "$WORLD_NAME" --port "$UDP_PORT" --http-port "$HTTP_PORT"

    # Check the exit status of the command.  If it's non zero we will assume it crashed
    # and we'll restart it.
    if [ $? -ne 0 ]; then
        echo "Fatal Error: Sapiens Server crashed with code $? . Restart in 5 seconds..."
    else
        echo "Sapiens Server stopped gracefully."
        break  # Exit the loop if the server stopped gracefully
    fi

    # Add a delay before restarting the server
    sleep 5
	echo "Restarting Sapiens server..."
done
