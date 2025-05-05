#!/bin/bash
# Calculator script
# bash 2_math.sh -d -o <operator> -n "<number> <number> <number> ..."

 USERNAME=(`whoami`)
 SCRIPT_NAME=$0
 OPERATOR=""
 NUMBERS_STRING=""
 RESULT=0


 while getopts "o:n:d" opt; do
    case "$opt" in
        o)
            OPERATOR=$OPTARG;;
        n)
            NUMBERS_STRING=$OPTARG;;
        d)
            DESCRIPTIVE="yes";;
        ?)
            echo "Invalid option: -$OPTARG"
            exit 1
            ;;
    esac
done

if [ -z $NUMBERS_STRING]; then
    echo 'Numbers missing [ -n "# # ..."]'
    exit 1
fi

IFS=' ' read -r -a NUMBERS <<< "$NUMBERS_STRING"

case "$OPERATOR" in
    +)
        for NUM in "${NUMBERS[@]}"; do
            RESULT=$((RESULT + NUM))
        done
        ;;
    -)
        RESULT=$((${NUMBERS[0]} * 2))
        for NUM in "${NUMBERS[@]}"; do
            RESULT=$((RESULT - NUM))
        done
        ;;
    \*)
        RESULT=1
        for NUM in "${NUMBERS[@]}"; do
            RESULT=$((RESULT * NUM))
        done
        ;;
    %)
        RESULT=${NUMBERS[0]}
        for ((i=1; i<${#NUMBERS[@]}; i++)); do
            NUM=${NUMBERS[i]}
            if (( NUM == 0 )); then
                echo "cannot divide by 0"
                exit 1
            fi
            RESULT=$((RESULT % NUM))
        done
        ;;
    *)
        echo "Invalid or null operator [ -o +|-|\*|% ]"
        exit 1
        ;;
esac

if [ $DESCRIPTIVE = "yes" ] 2> /dev/null; then
    echo "=DEBUG INFO="
    echo "$USERNAME is running $SCRIPT_NAME"
    echo "The operation is ${NUMBERS_STRING// /$OPERATOR} = $RESULT"
else
    echo "$RESULT"
fi