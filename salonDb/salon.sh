#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Salon Appointment Scheduler ~~~~~\n"

MAIN_MENU() {
  while true;
  do
    SERVICES_LIST=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

    echo "Services offered:"
    echo "$SERVICES_LIST" | while read SERVICE_ID BAR SERVICE
    do
      echo "$SERVICE_ID) $SERVICE"
    done

    echo -e "\nHow may I help you?" 
    echo -e "\nEnter the service_id, customer's phone number, customer's name, and appointment time."

    echo -e "\nService ID: "
    read SERVICE_ID_SELECTED

    # Check if the entered service_id exists
    SERVICE_EXISTENCE=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_EXISTENCE ]]
    then
      echo -e "\nInvalid service_id. Please enter a valid service_id.\n"
    else 
      break # Exit loop if a valid service_id is entered
    fi
  done

    echo -e "\nCustomer's Phone Number:"
    read CUSTOMER_PHONE

    # Grab name if phone number exists, or ask for name if it does not:
    CUSTOMER_NAME_EXISTENCE=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME_EXISTENCE ]]
    then
      echo -e "\nCustomer's Name"
      read CUSTOMER_NAME
      $PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')"
    else 
      CUSTOMER_NAME=$CUSTOMER_NAME_EXISTENCE
    fi

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    
    echo -e "\nAppointment Time:"
    read SERVICE_TIME

    # Insert appointment into appointments table
    $PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')"

    # Output confirmation message
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
  }

MAIN_MENU
