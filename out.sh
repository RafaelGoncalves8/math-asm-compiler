#!/bin/sh

program=$1
dirtests=./test
tests=`find $dirtests -name '*.in'`

for t in $tests
do
  echo "${t%.*}.s"
  $program < $t > ./${t%.*}.s
done
