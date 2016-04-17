#!/bin/bash

# sys_info_v2 - A script to produce an HTML file.

# this time lets try with cat command

############ Constants #################
TITLE="System Information for $HOSTNAME"
RIGHT_NOW=$(date +"%x %r %Z")
TIME_STAMP="Updated on $RIGHT_NOW by $USER"

########### Functions #################

system_info() {
  echo "function system_info"
}

show_uptime() {
  echo "
    <h2> System uptime </h2>
      <pre>
        $(uptime)
      </pre>
      "
}

drive_space() {
  echo "
    <h2> Filesystem space </h2>
    <pre>
      $(df)
    </pre>
  "
}

home_space() {
  # Only the super user can get this information.

  if [ "$(id -u)" = "0" ]
    then echo "
      <h2> Home directory space by user </h2>
      <pre>
        Bytes Directory
        $(du -s /Users/* | sort -nr)
      </pre>
    "
  fi

  # echo "
  #   <h2> Home directory space by user </h2>
  #   <pre>
  #     Bytes Directory
  #     $(du -s /Users/franklin/* | sort -nr)
  #   </pre>
  # "
}

########### Main ######################
cat << _EOF_
<html>
  <head>
    <title>
      $TITLE
    </title>
  </head>
  <body>
    <h1>$TITLE</h1>
    <p> $TIME_STAMP </p>
    $(system_info)
    $(show_uptime)
    $(drive_space)
    $(home_space)
  </body>
</html>
_EOF_

# run this on terminal
#./sys_info_v2.sh > sys_info_v2.html

# make use of printenv to see all the environment variables.
