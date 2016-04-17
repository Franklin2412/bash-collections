#!/bin/bash
# My first script
echo "Hello world!"

#display path
echo $PATH

# lets make some alias
alias l='ls -l'

#some shell functions.
today() {
  echo -n "Today's date is: "
  date +"%A, %B %-d, %Y"
}
