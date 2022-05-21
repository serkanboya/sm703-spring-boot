#!/bin/sh
cd $(dirname $0)

cd ../complete

./mvnw spring-boot:run
