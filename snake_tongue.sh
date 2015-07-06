#!/bin/bash
#NAME: 		Snake Tongue
#PURPOSE:	Provides the password
#		detection list.
#Created By:	Richard L. Jackson
#
#USAGE:		./snake_tongue.sh [COMMAND] [[ITERATION]]


argv[0]=$1
argv[1]=$2
venom="striker"


create_key_list(){
limit=$1
if [ ! -z "$limit" ];
then

	for (( heads=0; $heads < $limit; heads++ ))
	do
		for a in {1..26}
		do
			alpha=( 'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z' )
			#symbol=( '@' '#' '%' '^' '&' '*' '(' ')' '-' '_' '+' )
			symbol=( '4@^}' '-$-$4' '&8)-1' '#1^9' '&(&)4' '@%3&4' '&28&3' '*9_' '*32' '02(' '5_82' )
			for b in {0..11}
			do
				for left in {0..25}
				do
					case $b in
						7|4)
						_seq1="${alpha[$left]}"
						_seq2="${symbol[$(echo $RANDOM$RANDOM$RANDOM | cut -c 2)]}"
						_seq3="$(echo $RANDOM$RANDOM$RANDOM | cut -c 3)"
						_seq4="${alpha[$(echo $RANDOM$RANDOM$RANDOM | cut -c 1)]}"
						_seq5="${alpha[$(echo $RANDOM$RANDOM$RANDOM | cut -c 1)]}"
						_seq6="$(echo $RANDOM$RANDOM$RANDOM | cut -c 2)"
						_seq7="${symbol[$b]}"
						;;
						5|3|0)
						_seq2="${alpha[$(echo $RANDOM$RANDOM$RANDOM | cut -c 1)]}"
						_seq5="${symbol[$(echo $RANDOM$RANDOM$RANDOM | cut -c 2)]}"
						_seq3="$(echo $RANDOM$RANDOM$RANDOM | cut -c 2)"
						_seq7="${alpha[$left]}"
						_seq1="${alpha[$(echo $RANDOM$RANDOM$RANDOM | cut -c 1)]}"
						_seq6="$(echo $RANDOM$RANDOM$RANDOM | cut -c 2)"
						_seq4="${symbol[$b]}"
						;;
						2|1|6)
						_seq7="${alpha[$(echo $RANDOM$RANDOM$RANDOM | cut -c 1)]}"
						_seq1="${symbol[$(echo $RANDOM$RANDOM$RANDOM | cut -c 2)]}"
						_seq6="$(echo $RANDOM$RANDOM$RANDOM | cut -c 2)"
						_seq5="${alpha[$(echo $RANDOMRANDOM$RANDOM | cut -c 1)]}"
						_seq2="${alpha[$left]}"
						_seq4="$(echo $RANDOM$RANDOM$RANDOM | cut -c 2)"
						_seq3="${symbol[$b]}"
						;;
					esac
					case $b in
						5|0|2|6)
						printf "%s%s%s%s%s%s%s%s\n" $_seq3 $_seq1 $_seq6 $_seq4 $_seq1 $_seq5 $_seq2 $_seq7 | tee -a $venom$heads
						;;
						7|1|4|3)
						printf "%s%s%s%s%s%s%s%s\n" $_seq5 $_seq2 $_seq4 $_seq6 $_seq4 $_seq7 $_seq3 $_seq1 | tee -a $venom$heads
						;;
					esac
				done
			done
		done
	done
else
	echo "Error: Failure by iteration execution"
	exit 2
fi
}


case ${argv[0]} in
	-l|--loop)
	if [ ! -z "${argv[1]}" ];
	then
		create_key_list ${argv[1]}
	else
		echo "Error: Limit was not set!"
	fi
	;;
	*)echo "Error: Missing or invalid parameter was entered!";;
esac
