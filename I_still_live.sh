#!/bin/bash

# Function to write timestamps
write_timestamps() {
    FILE="I_still_live.txt"

    # Check if the file doesn't exist, then create it
    [ ! -f "$FILE" ] && touch "$FILE"

    # Infinite loop
    while true; do
        # Get the current date and time in the specified format
        TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S')"

        # Write the timestamp to the file
        echo "$TIMESTAMP" >> "$FILE"
    
        # Echo the timestamp to the console
        echo "$TIMESTAMP"

        # Wait for 1 minute
        sleep 60
    done
}

# If the script is run with the argument "inside", run the function directly
if [ "$1" == "inside" ]; then
    write_timestamps
    exit
fi

# Terminate all screen sessions named "timestamp_session"
for session in $(screen -ls | grep 'timestamp_session' | cut -d. -f1); do
    screen -X -S "$session" quit
done

# Start a new screen session and run the function within that session
screen -S timestamp_session -dm bash -c "$0 inside"
