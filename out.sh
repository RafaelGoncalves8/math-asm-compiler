#! /bin/sh

program=$1
dirtestes=./test
tests=`find $dirtestes -name '*.in'`

for t in $tests
do
  $program < $t > ./$$.s
done
