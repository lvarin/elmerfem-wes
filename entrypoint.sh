#!/bin/bash

FILE=$1

if [[ -z $FILE || ! -f $FILE ]];
then
  echo "ERROR: ($FILE) File not found" >&2
  exit 1
fi

unzip $FILE

find . -maxdepth 4 -name job.sh -exec {} \;
