#!/bin/bash

echo $((2+2))

echo $(( 2+2 ))

echo $(( 2 + 2 ))

first_num=0
second_num=0

echo -n "Enter the first number -> "
read first_num
echo -n "Enter the second number -> "
read second_num

#Arithmatic operation

echo "
  first number + second number = $((first_num + second_num))
  first number - second number = $((first_num - second_num))
  first number * second number = $((first_num * second_num))
  first number / second number = $((first_num / second_num))
  first number % second number = $((first_num % second_num))
  first number raised to the power of second number = $((first_num ** second_num))
  "
 # odd even test

 number=0
 echo -n "Enter a number > "
 read number

 echo "Number is $number"
 if [ $((number % 2)) -eq 0 ]
   then echo "Number is even"
 else
   echo "Number is odd"
 fi


seconds=0
echo -n "Enter number of seconds > "
read seconds

hours=$(( seconds / 3600 ))
seconds=$(( seconds % 3600 ))
minutes=$(( seconds / 60 ))
seconds=$(( seconds % 60 ))

echo "$hours hours(s) $minutes minutes(s) $seconds seonds(s)"
