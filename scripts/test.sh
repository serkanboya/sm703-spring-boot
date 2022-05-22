#!/bin/sh
cd $(dirname $0)

cd ../complete

./mvnw test
ret=$?
if [ $ret -ne 0 ]; then
exit $ret
fi
rm -rf target

exit
