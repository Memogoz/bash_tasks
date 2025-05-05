#!/bin/bash

function fibonacci {
	local NUM=$1
	if [ "$NUM" -le 1 ]; then
		echo "$NUM"
	else
		echo "$(( $(fibonacci $((NUM - 1))) + $(fibonacci $((NUM - 2))) ))"
	fi
}

echo "Enter a number to calculate it's Fibonacci: "
read NUMBER

if [ "$NUMBER" -ge 0 ] 2> /dev/null; then
	echo "Result = $(fibonacci $NUMBER)"
else 
	echo "Invalid input"
fi
