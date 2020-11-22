#!/bin/bash

export CONNECT_REST_ADVERTISED_HOST_NAME=$(hostname)
echo $CONNECT_REST_ADVERTISED_HOST_NAME

IFS=$'\n'
for s in $(echo $CONNECT_CREDS | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" ); do export $s ;  done
/etc/confluent/docker/run || exit 1
