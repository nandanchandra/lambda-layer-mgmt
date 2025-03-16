#!/bin/sh

container_name=py_mnt
docker_image=aws_mnt_image

docker build -t $docker_image .
docker run -td --name=$container_name $docker_image

docker cp ./requirements.txt $container_name:/
docker cp ./build.sh $container_name:/build.sh

docker exec -i $container_name /bin/bash < ./build.sh

docker cp $container_name:/python.zip python.zip

docker stop $container_name
docker rm $container_name
