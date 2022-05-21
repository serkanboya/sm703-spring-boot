#!/bin/sh
cd $(dirname $0)

cd ../complete

./mvnw install
docker build -t helloworld .
docker stop $(docker ps -q --filter ancestor=helloworld )
docker run -p 8088:8088 helloworld
