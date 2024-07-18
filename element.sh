#!/bin/bash

# PSQL query
PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t -c"

# check and treat if imput was made
if [[ $1 ]]; then
  # if imput is number query for atomic number
  if [[ $1 =~ ^[0-9]+$ ]]; then
    QUERY_ATOMIC_NUM=$($PSQL "SELECT atomic_number, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1;")
    if [[ -z $QUERY_ATOMIC_NUM ]]; then
      echo "I could not find that element in the database."
    else
      echo $QUERY_ATOMIC_NUM | while read ATOMIC_NUM BAR NAME BAR TYPE BAR ATOMIC_MASS BAR MELTING BAR BOILING BAR SYMBOL
      do
        echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    fi
  # elif imput -le 2 query for symbol
  elif [[ ${#1} -le 2 ]]; then
    QUERY_SYMBOL=$($PSQL "SELECT atomic_number, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol ILIKE '$1';")
    if [[ -z $QUERY_SYMBOL ]]; then
      echo "I could not find that element in the database."
    else
      echo $QUERY_SYMBOL | while read ATOMIC_NUM BAR NAME BAR TYPE BAR ATOMIC_MASS BAR MELTING BAR BOILING BAR SYMBOL
      do
        echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    fi
  # elif imput -gt 2 query ilike name
  elif [[ ${#1} -gt 2 ]]; then
    QUERY_NAME=$($PSQL "SELECT atomic_number, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE name ILIKE '$1';")
    if [[ -z $QUERY_NAME ]]; then
      echo "I could not find that element in the database."
    else    
      echo $QUERY_NAME | while read ATOMIC_NUM BAR NAME BAR TYPE BAR ATOMIC_MASS BAR MELTING BAR BOILING BAR SYMBOL
      do
        echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    fi
  # else echo could not find
  else
    echo "I could not find that element in the database."
  fi
else
  echo "Please provide an element as an argument."
fi