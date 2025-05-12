# How to Run the Scripts

## Prerequisites
- Ensure you have a Unix-like operating system (Linux, macOS, or WSL on Windows).
- Make sure you have Bash installed (most Unix-like systems have it by default).
- Verify that the scripts have executable permissions. If not, you can add executable permissions using the following command:
    ```bash
    chmod +x <file>
    ```

## `1_Fibonacci.sh`
Script that calculates numbers from the Fibonacci sequence.

- Execute the script by running:
     ```bash
     bash 1_Fibonacci.sh
     ```
- Follow the prompts or instructions provided by the script.


## `2_Calculator.sh`
Script that makes simple calculations.

- Execute the script by running:
     ```bash
     bash 2_Calculator.sh -o <operator(+,-,\*,%)> -n "numbers" -d (optional)
     ```
     Example:
     ```bash
     bash 2_Calculator.sh -o \* -n "3 3 3" -d
     ```

## `3_FizzBuzz.sh`
Script that shows multiples of 3, 5 and 15 as 'Fizz' 'Buzz' and 'FizzBuzz' respectively.

- Execute the script by running:
     ```bash
     bash 3_FizzBuzz.sh
     ```

## `4_CaesarCipher.sh`
Script that ciphers files by shifting *n* positions their characters and symbols.

- Execute the script by running:
     ```bash
     bash 4_CaesarCipher.sh -s <shift> -i <input_file> -o <output_file>
     ```
    Example:
    ```bash
    bash 4_CaesarCipher.sh -s 3 -i input.txt -o output.txt
    ```

## `5_TextFormatter.sh`
Script that formats text in files by swapping case, reversing lines, converting to lower/upper case and substituting words.<br>
     *-v* : Swap case of letters <br>
     *-r* : Reverse lines <br>
     *-l* : Convert to lower case <br>
     *-u* : Convert to upper case <br>
     *-s* : Substitute A_WORD with B_WORD <br>

- Execute the script by running:
     ```bash
     bash 5_TextFormatter.sh -i <input_file> -o <output_file> [-v] [-r] [-l] [-u] [-s <A_WORD> <B_WORD>]
     ```
     Example:
     ```bash
     bash 5_TextFormatter.sh -i input.txt -o output.txt -r -u -s "hello" "bye"
     ```

## `6_Report.sh`
Script that generates a System Info Report and writes it to a file.

- Execute the script by running:
     ```bash
     bash 6_Report.sh
     ````


## `99_Database.sh`
Script that creates a SQLite database, creates tables, inserts data, deletes data, and selects data.

- Execute the script functions by running:
     ```bash
     bash 99_Database.sh create_db <database_name>
     bash 99_Database.sh create_table <database_name> <table_name> <field1> <field2> ...
     bash 99_Database.sh insert_data <database_name> <table_name> <value1> <value2> ...
     bash 99_Database.sh delete_data <database_name> <table_name> <condition>
     bash 99_Database.sh select_data <database_name> <table_name>
     ```
     Example:
     ```bash
     bash 99_Database.sh create_db myDatabase
     bash 99_Database.sh create_table myDatabase.db people name age gender
     bash 99_Database.sh insert_data myDatabase.db people Jhon 25 Male
     bash 99_Database.sh select_data myDatabase.db people
     bash 99_Database.sh delete_data myDatabase.db people name=Jhon 
     ```

    
