#!/bin/bash
# Fibonacci script

function fibonacci {
	local NUM=$1
	if [ "$NUM" -le 1 ]; then
		echo "$NUM"
	else
		echo "$(( $(fibonacci $((NUM - 1))) + $(fibonacci $((NUM - 2))) ))"
	fi
}

echo "Enter the position of the Fibonacci number you'd like to see:"
read NUMBER

if [ "$NUMBER" -ge 0 ] 2> /dev/null; then
	echo "The Fibonacci number at position $NUMBER is : $(fibonacci $NUMBER)"
else 
	echo "Invalid input"
fi
