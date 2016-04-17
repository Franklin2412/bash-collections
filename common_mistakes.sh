#!/bin/bash

# number=1

# if [ $number = "1" ]
#   then echo "Number equals 1"
# else
#   echo "Number does not equal 1"
# fi

# number=
#
# if [ "$number" = "1" ]
#   then echo "Number equals 1"
# else
#   echo "Number does not equal 1"
# fi

number=

if [ "$number" = "1" ]
  then echo "Number equals 1"
else
  echo "Number does not equal 1"
fi

#using set -x to trace the code

set -x
number=

if [ "$number" = "1" ]
  then echo "Number equals 1"
else
  echo "Number does not equal 1"
fi
set +x
