#!/bin/bash

terminal=`tty`
exec < users.txt
while read line
do 
    username=`echo $line | cut -d" " -f 2`
    task=`echo $line | cut -c1-2`
    if [ $task == "[A" ]
    then
	gpasswd -a $username sudo
	echo $username made administrator
    elif [ $task == "[S" ]
    then
	gpasswd -d $username sudo
	echo $username made standard
    elif [ $task == "[D" ]
    then
	userdel $username
	echo $username deleted
    elif [ $task == "[P" ]
    then
	newpass=`echo $line | cut -d" " -f 3`
	echo -e "$newpass\n$newpass" | passwd $username	
	echo $username"'s password changed to: "$newpass
    fi
done
