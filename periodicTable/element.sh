#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# Check if an argument is provided
if [ -z $1 ]; then
    echo "Please provide an element as an argument."
else 
  # checks if argument is a number
  if [[ $1 =~ ^[0-9]+$ ]] 
  then
    # grabs info using atomic_number
    ELEMENT_INFO=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE atomic_number = '$1'")
  else 
    # grabs info using name or symbol
    ELEMENT_INFO=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE symbol = '$1' OR name = '$1'")
  fi

  # check if info does NOT exist
  if [[ -z $ELEMENT_INFO ]]
  then 
  echo "I could not find that element in the database."
  else
    # puts DB element info into variables
    echo $ELEMENT_INFO | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME
    do
      # gets element property info 
      PROPERTIES_INFO=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, type_id FROM properties WHERE atomic_number='$ATOMIC_NUMBER'")
      # puts DB property info into variables
      echo $PROPERTIES_INFO | while read MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE_ID
      do
        # gets type from DB and trims leading space
        TYPE=$(echo $($PSQL "SELECT type FROM types WHERE type_id = '$TYPE_ID'") | sed -e 's/^ //')

        # writes out info to shell
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
    done
  fi
fi
