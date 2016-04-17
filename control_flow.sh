#!/bin/bash

#exit with 0 - succes
true
echo $?

#exit with 1 - failure
false
echo $?

#simple if
if true; then echo "Its true."; fi
if false; then echo "Its false."; fi

# simple test
if [ -f ~/.bash_history ]; then
  echo "You have a .bash_history. Things are fine."
else
  echo "Yikes! you have no .bash_history!"
fi

#test for super user
#use id command id -u == 0

if [ $(id -u) = "0" ]
  then echo "superuser"
else
  echo "not a super user"
fi

if [ $(id -u) != "0" ]
  then echo "You must be the super user to run the script" >$2
  exit 1
fi
