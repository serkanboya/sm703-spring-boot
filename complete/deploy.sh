#!/bin/sh
cd $(dirname $0)

cd ../complete

nohup ./mvnw spring-boot:run >> server.log 2>&1&
