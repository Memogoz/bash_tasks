# How to Run the Scripts

## Prerequisites
- Ensure you have a Unix-like operating system (Linux, macOS, or WSL on Windows).
- Make sure you have Bash installed (most Unix-like systems have it by default).
- Verify that the scripts have executable permissions. If not, you can add executable permissions using the following command:
    ```bash
    chmod +x <file>
    ```

## Running `1_fibonacci.sh`
Script that calculates Fibonacci numbers.

- Execute the script by running:
     ```bash
     bash 1_fibonacci.sh
     ```
- Follow the prompts or instructions provided by the script.


## Running `2_calculator.sh`
Script that makes simple calculations.

- Execute the script by running:
     ```bash
     bash 2_calculator.sh -o <operator(+,-,\*,%)> -n "numbers" -d (optional)
     ```
    Example:
    ```bash
    bash 2_calculator.sh -o \* -n "3 3 3" -d
    ```

## Running `3_FizzBuzz.sh`
Script that shows multiples of 3, 5 and 15 as 'Fizz' 'Buzz' and 'FizzBuzz' respectively.

- Execute the script by running:
     ```bash
     bash 3_FizzBuzz.sh
     ```