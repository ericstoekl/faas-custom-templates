#!/bin/sh

while read line
do
  echo "$line"
done < "${1:-/dev/stdin}"

# Your code here...
# $line is stdin data sent to function

