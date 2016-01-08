#!/usr/bin/env bash

curl --header 'Access-Token: $PUSHBULLET_API_TOKEN' \
     --header 'Content-Type: application/json' \
     --data-binary "{\"body\":\"$2\",\"title\":\"$1\",\"type\":\"note\"}" \
     --request POST \
     https://api.pushbullet.com/v2/pushes
