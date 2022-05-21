#!/bin/sh
cd $(dirname $0)

cd ../complete

./mvnw install
docker build -t helloworld .
docker run -p 8088:8088 helloworld
