#!/bin/sh

program=$1
dirtests=./test
tests=`find $dirtests -name '*.in'`

echo "$program"

for t in $tests
do
  echo "$t"
  echo "${t%.*}"
  $program < $t > ./${t%.*}.s
done
