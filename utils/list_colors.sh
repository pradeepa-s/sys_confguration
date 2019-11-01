#!/usr/bin/env bash
j=0
for i in {0..255} ; do
	if [ $j -eq 6 ]
	then
		printf "\n"
		j=0
	else
		j=$((j+1))
	fi
    printf "\x1b[38;5;${i}mcolour${i}\t"
done
