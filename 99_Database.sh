#!/bin/bash
# Database creation and manipulation

function create_db {
    sqlite3 "$1" ""
    if [[ $? -eq 0 ]]; then
        echo "Database $1 successfully created"
    else
        echo "Error while creating the database"
    fi
}

function create_table {
    local DATABASE_NAME=$1
    shift
    local TABLE_NAME=$1
    shift
    local COLUMNS=$(echo "$@" | tr ' ' ',')
    sqlite3 "$DATABASE_NAME" "CREATE TABLE $TABLE_NAME ($COLUMNS);"
    if [[ $? -eq 0 ]]; then
        echo "Table $TABLE_NAME created successfully in $DATABASE_NAME"
    else
        echo "Error creating table $TABLE_NAME in $DATABASE_NAME"
    fi
}

function insert_data {
    local DATABASE_NAME=$1
    shift
    local TABLE_NAME=$1
    shift
    local VALUES=$(printf "'%s'," "$@" | sed 's/,$//')
    sqlite3 "$DATABASE_NAME" "INSERT INTO $TABLE_NAME VALUES ($VALUES);"
    if [[ $? -eq 0 ]]; then
        echo "Data inserted successfully into $TABLE_NAME in $DATABASE_NAME"
    else
        echo "Error inserting data into $TABLE_NAME in $DATABASE_NAME"
    fi
}

function delete_data {
    if [[ -z "$3" ]]; then
        echo "Error : missing condition"
        return 1
    fi

    # Condition cleanance
    local condition_raw="$3"
    local column="${condition_raw%%=*}"
    local value="${condition_raw#*=}"

    if [[ -z "$column" || -z "$value" ]]; then
        echo "ERROR: Condición inválida. Debe ser del tipo columna=valor"
        return 1
    fi

    value="${value//\'/''}"
    
    sqlite3 "$1" "DELETE FROM $2 WHERE \"$column\" = '$value';"
    if [[ $? -eq 0 ]]; then
        echo "Delete command executed succesfully on $1 in $2"
    else
        echo "Error deleting data from $1 in $2"
    fi
}

function select_data {
    sqlite3 -header -column "$1" "SELECT * FROM $2;"
    if [[ $? -ne 0 ]]; then
        echo "Error selecting data from $1 in $2"
    fi
}


sqlite3 --version 2>&1 /dev/null
if [[ $? -ne 0 ]]; then
    echo "sqlite3 not found [sudo dnf install -y sqlite]"
fi

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <database_name> <command> [<args>]"
    echo "Commands:"
    echo "  $0 create_db <database_name.db>"
    echo "  $0 create_table <database_name> <table_name> <field1> <field2> ..."
    echo "  $0 insert_data <database_name> <table_name> <value1> <value2> ..."
    echo "  $0 delete_data <database_name> <table_name> <condition>"
    echo "  $0 select_data <database_name> <table_name>"
    exit 0
fi

COMMAND="$1"
shift

# Check the funtions exists
if declare -f "$COMMAND" > /dev/null; then
  "$COMMAND" "$@"
else
  echo "Error: Function '$COMMAND' not found"
  exit 1
fi

