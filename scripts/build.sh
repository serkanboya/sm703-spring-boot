#!/bin/sh
cd $(dirname $0)

cd ../complete

./mvnw clean package
ret=$?
if [ $ret -ne 0 ]; then
exit $ret
fi

exit
