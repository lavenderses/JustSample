#!/bin/bash

container_name=jenkins

docker_line=`docker ps -a | grep $container_name | sed 's/"//g'`
container_id=`awk '{print $1}' <<< $docker_line`
echo "Continer ID: $container_id"

if [ -z $container_id ]; then
    echo "Container ID for $container_name does\'t exist. Build One."
    docker run -d -p 8080:8080 -p 50000:50000 -v --restart=always \
        -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
else
    echo "Start Jenkins Container."
    docker start $container_id
fi
