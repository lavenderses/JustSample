#!/bin/bash

container_name=jenkins

docker_line=`docker ps | grep $container_name | sed 's/"//g'`
container_id=`awk '{print $1}' <<< $docker_line`
echo "Continer ID: $container_id"

if [ -z $container_id ]; then
    echo "Container ID for $container_name does\'t exist."
else
    echo "Stop Jenkins Container."
    docker start $container_id
fi
