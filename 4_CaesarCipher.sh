#!/bin/bash
# Caesar Cipher Script
# bash 4_CaesarCipher.sh -s <shift> -i <input_file> -o <output_file>

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 -s <shift> -i <input_file> -o <output_file>"
    exit 1
fi

 while getopts "s:i:o:" opt; do
    case "$opt" in
        s)
            SHIFT=$OPTARG
            if ! [[ "$OPTARG" =~ ^[0-9]+$ ]]; then
                echo "Invalid -s argument"
                exit 1
            fi
            ;;
        i)
            INPUT_FILE=$OPTARG
            if [[ ! -r "$OPTARG" || ! -e "$OPTARG" ]]; then
                echo "Invalid input file"
                exit 1
            fi
            ;;
        o)
            OUTPUT_FILE=$OPTARG
            if [[ -e "$OPTARG" && ! -w "$OPTARG" ]]; then
                echo "Output file isn't writeable"
                exit 1
            fi
            ;;
        ?)
            echo "Invalid option"
            exit 1
            ;;
    esac
done

echo "" > "$OUTPUT_FILE"

while IFS= read -r -n1 CHAR; do
    if [[ -z "$CHAR" ]]; then
        echo "" >> "$OUTPUT_FILE"
    else
        ASCII=$(printf "%d" "'$CHAR")
        
        if (( ASCII >= 32 && ASCII <= 126 )); then
            NEW_ASCII=$(( (ASCII - 32 + SHIFT) % 95 + 32 ))
            printf "\\$(printf '%03o' "$NEW_ASCII")" >> "$OUTPUT_FILE"
        else
            printf "%s" "$CHAR" >> "$OUTPUT_FILE"
        fi
    fi
done < "$INPUT_FILE"

echo "Ciphered text written to $OUTPUT_FILE"