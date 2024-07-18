#!/bin/bash

# PSQL query
PSQL="psql --username=freecodecamp --dbname=periodic_table -c -t"

# check and treat if imput was made
if [[ $1 ]]; then
  # if imput is number query for atomic number
  if [[ $1 =~ ^[0-9]+$ ]]; then
    echo "number"
  # elif imput -le 2 query for symbol
  elif [[ ${#1} -le 2 ]]; then
    echo "symbol"
  # elif imput -gt 2 query ilike name
  elif [[ ${#1} -gt 2 ]]; then
    echo "name"
  # else echo could not find
  else
    echo "I could not find that element in the database."
  fi
else
  echo "Please provide an element as an argument."
fi