#!/bin/bash

# Initialize variables
input_file=""
output_file=""
swap_case=false
reverse_lines=false
lower_case=false
upper_case=false
substitute=false
sub_a=""
sub_b=""

# Parse options 
while getopts ":i:o:s:vrlu" opt; do
    case $opt in
        i)
            input_file="$OPTARG"
            ;;
        o)
            output_file="$OPTARG"
            ;;
        s)
            sub_a="$OPTARG"
            sub_b="${!OPTIND}"
            OPTIND=$((OPTIND + 1))
            substitute=true
            ;;
        v)
            swap_case=true
            ;;
        r)
            reverse_lines=true
            ;;
        l)
            lower_case=true
            ;;
        u)
            upper_case=true
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

# Check required arguments
if [[ -z "$input_file" || -z "$output_file" ]]; then
    echo "Usage: $0 -i <input_file> -o <output_file> [-v] [-r] [-l] [-u] [-s <A_WORD> <B_WORD>]"
    echo -e "Options:\n  -i <input file>   Input file to read from\n  -o <output file>  Output file to write to\n  -v               Swap case of letters\n  -r               Reverse lines\n  -l               Convert to lower case\n  -u               Convert to upper case\n  -s <A_WORD> <B_WORD> Substitute A_WORD with B_WORD"
    exit 1
fi

# Read input
content=$(cat "$input_file")

# Apply transformations in order
if $swap_case; then
    content=$(echo "$content" | tr 'a-zA-Z' 'A-Za-z')
fi

if $substitute; then
    content=$(echo "$content" | sed "s/${sub_a}/${sub_b}/g")
fi

if $reverse_lines; then
    content=$(echo "$content" | rev)
fi

if $lower_case; then
    content=$(echo "$content" | tr 'A-Z' 'a-z')
fi

if $upper_case; then
    content=$(echo "$content" | tr 'a-z' 'A-Z')
fi

# Output result
echo "$content" > "$output_file"
echo "Text formatting completed. Output written to $output_file"