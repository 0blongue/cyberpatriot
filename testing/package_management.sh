#!/bin/bash

terminal=`tty`
exec<packages.txt
while read line
do
    firstchar=`echo $line | cut -c1`
    if [ $firstchar != "#" ]
    then
	apt-get purge -qq $line
    fi
done
