#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
# echo "$SECRET_NUMBER"

echo "Enter your username:";
read USERNAME

# RETURNING_USER=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")
USER_ID=$($PSQL "select user_id from users where username = '$USERNAME'")

if [[ -z $USER_ID ]]
then 
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

    #insert to users table
    INSERTED_TO_USERS=$($PSQL "insert into users(username) values('$USERNAME')")
    #get user_id
    USER_ID=$($PSQL "select user_id from users where username = '$USERNAME'")
else
    #get games played
    GAMES_PLAYED=$($PSQL "select count(user_id) from games where user_id = '$USER_ID'")

    #get best game (guess)
    BEST_GUESS=$($PSQL "select min(guesses) from games where user_id = '$USER_ID'")

    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses."

fi

TRIES = 0
echo -e "\nGuess the secret number between 1 and 1000:"

while [[ ! $GUESS -eq $SECRET_NUMBER ]];
do 
  read GUESS

  TRIES=$(($TRIES + 1))
  
  if [[ ! $GUESS =~ ^[0-9]+$  ]];
  then 
    echo "That is not an integer, guess again:"
  else

    if [[ $GUESS -gt $SECRET_NUMBER ]];
    then
      echo "It's lower than that, guess again:"

    elif [[ $GUESS -lt $SECRET_NUMBER ]];
    then
      echo "It's higher than that, guess again:"
    
    fi

  fi

done

echo -e "\nYou guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
INSERTED_TO_GAMES = $($PSQL "insert into games(user_id, guesses) values($USER_ID, $TRIES)")
