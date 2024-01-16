#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

function GUESSING {
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
            local user_info=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$username'")
            IFS="|" read games_played best_game <<< $user_info

            if [ -z "$best_game" ] || [ "$attempts" -lt "$best_game" ]; then
                # Update database with the new best game
                echo "$attempts number of attempts"
                local insert_best_game=$($PSQL "UPDATE users SET best_game = $attempts WHERE username = '$username'")
            fi

            # Update database with the number of games played
            local update_user=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$username'")
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
user_info=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username = '$username'")

if [ -n "$user_info" ]; then
    # User exists
    IFS="|" read user games_played best_game <<< $user_info
    echo "Welcome back, $user! You have played $games_played games, and your best game took $best_game guesses."

else
    # New user
    insert_user=$($PSQL "INSERT INTO users (username) VALUES ('$username')")
    echo "Welcome, $username! It looks like this is your first time here."
fi

# Call the GUESSING function
GUESSING $username

}

DISPLAY
