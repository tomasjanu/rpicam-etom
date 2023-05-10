#!/bin/bash

# Replace with your server's IP or domain and the Discord webhook URL
SERVER_IP_OR_DOMAIN="192.168.0.169" # Here your public url!
DISCORD_WEBHOOK_URL="https://discord.com/api/webhooks/1105944712801697892/ugqeJ2FstaWhCD1fyAuVf6fOC9n05UuGse2xYcibFRiQiIH8KiM9BAj60vbUR0DEzNON"

# Get the thumbnail and video file names from the trigger
list=( $1*.th.jpg )
thumb="${list[-1]}"
video="$1"

# Construct the URL for the .mp4 file
MP4_URL="http://${SERVER_IP_OR_DOMAIN}/media/$(basename ${video})"

# Send the image and the URL to Discord
curl -H "Content-Type: multipart/form-data" \
     -X POST \
     -F file=@"${thumb}" \
     -F "payload_json={\"content\":\"Motion detected! [Video here](${MP4_URL})\"}" \
     ${DISCORD_WEBHOOK_URL}