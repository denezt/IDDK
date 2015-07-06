#!/bin/bash

limit=$1
venom="striker"

if [ ! -z "$limit" ];
then

	for (( head=0; $head < $limit; head++ ))
	do
		for a in {1..26}
		do
			alpha=( 'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z' )
			symbol=( '!' '@' '#' '$' '%' '^' '&' '*' '(' ')' '-' '_' '+' )
			#uuidgen | tr "-" "\n" | tee -a $venom$head
			#printf "Random[0]\t|%i|%i\n" $(echo $RANDOM | cut -c -2) $(echo $RANDOM | cut -c 2-)
			printf "%c%i%i" ${alpha[$(echo $RANDOM | cut -c 1)]} $(echo $RANDOM | cut -c -2) $(echo $RANDOM | cut -c 2-)
			for b in {0..10}
			do
				printf "Random[1]:\t%s%s%s\n" "$RANDOM${alpha[$a]}" "${symbol[$b]}" "$(echo $RANDOM | cut -c 2)"
			done
		done
	done
else
	echo "Error: Limit was not set!"
fi
