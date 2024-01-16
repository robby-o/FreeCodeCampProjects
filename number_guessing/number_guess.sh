#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

function GUESSING(){
    local username=$1
    local secret_number=$((RANDOM % 1000 + 1))
    local attempts=0

    echo "Guess the secret number between 1 and 1000:"

    while true; do
        read guess

        # Check if the input is an integer
        if [[ ! $guess =~ ^[0-9]+$ ]]; then
            echo "That is not an integer, guess again:"
            continue
        fi

        ((attempts++))

        if [ "$guess" -eq "$secret_number" ]; then
            # Check if it's a new best game
            # local user_info=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$username'")
            local user_id=$($PSQL "SELECT user_id FROM users WHERE username = '$username'")
            local best_game=$($PSQL "SELECT best_game FROM games WHERE user_id = $user_id")
            # IFS="|" read games_played best_game <<< $user_info

            if [ -z "$best_game" ] || [ "$attempts" -lt "$best_game" ]; then
                # Update database with the new best game
                local insert_best_game=$($PSQL "UPDATE games SET best_game = $attempts WHERE user_id = '$user_id'")
            fi

            # Update database with the number of games played
            local update_user=$($PSQL "UPDATE games SET games_played = games_played + 1 WHERE user_id = '$user_id'")
            echo "You guessed it in $attempts tries. The secret number was $secret_number. Nice job!"
            break
        elif [ "$guess" -lt "$secret_number" ]; then
            echo "It's higher than that, guess again:"
        else
            echo "It's lower than that, guess again:"
        fi
    done
}

DISPLAY() {
    echo "Enter your username:"
    read username

    # Check if the username exists in the database
    # user_info=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username = '$username'")
    user_id=$($PSQL "SELECT user_id FROM users WHERE username='$username'")
    if [ -n "$user_id" ]; then
        # User exists
        user_info=$($PSQL "SELECT games_played, best_game FROM games WHERE user_id = '$user_id'")
        IFS="|" read games_played best_game <<< $user_info
        echo "gp $games_played, bg $best_game"
        echo -e "\nWelcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
    else
        # New user
        insert_user=$($PSQL "INSERT INTO users (username) VALUES ('$username')")
        user_id=$($PSQL "SELECT user_id FROM users WHERE username='$username'")
        insert_game=$($PSQL "INSERT INTO games (user_id) VALUES('$user_id')")
        echo "Welcome, $username! It looks like this is your first time here."
    fi

    # Call the GUESSING function
    GUESSING $username
}

DISPLAY
