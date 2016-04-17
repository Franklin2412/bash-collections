#!/bin/bash

echo -n "Enter some text > "
read text
echo "You entered: $text"

# Time out example.

echo -n "Enter your name you got 5 sec > "
if read -t 5 name
  then echo "I got your name. It is $name"
else
  echo "Sorry, time out. Try again"
fi

# password using -s

echo -n "Enter your password >"
read -s password
echo "$password"
