#!/bin/bash

for c in $CONNECT_CLUSTERS; do
    NAME=$(echo $c | awk -F\:\: '{print $1}')
    URL=$(echo $c | awk -F\:\: '{print $2}')
    echo $NAME - $URL
    export CONFLUENT_CONTROL_CENTER_CONNECT_${NAME}_CLUSTER=$URL
    export CONTROL_CENTER_CONNECT_${NAME}_CLUSTER=$URL
    env | grep CONTROL_CENTER_CONNECT
done

CONFLUENT_CONTROLCENTER_ID=$RANDOM
CONTROL_CENTER_ID=$RANDOM

IFS=$'\n'
for s in $(echo $CC_CREDS | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" ); do
    export $s
done
echo "STARTING CONTROL CENTER"
/etc/confluent/docker/run
