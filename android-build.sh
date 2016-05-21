#!/bin/bash

################### README ###################
# open git bash / terminal.
# clone Android test project using the following command
#   git clone git@gitlab.payu.in:payu/android-sdk-test-project.git
# navigate to the projec using the following command
#   cd android-sdk-test-project
# initialise and update submodules using following commands
#   git submodule init
#   git submodule update
# then place build.sh and local.properties under "android-sdk-test-project/" .
# open local.properties file and set your sdk path.
# in case of windows it should look some thing like
#   sdk.dir=C:\\\Documents and Settings\\\UserName\\\Local Settings\\\Application Data\\\Android\\\android-studio\\\sdk
# in case of ubuntu it should look something like
#   sdk.dir=/Users/franklin/Library/Android/sdk
# if you dont have sdk please download from https://developer.android.com/intl/ko/sdk/installing/index.html
# open set permission to build.sh file using the follwoing command.
#   chmod 755 build.sh
# run the build script using the following command.
#   ./build.sh
# it will ask cb branch name and debug value.
# accordingly it will build the apk,
# once the build is done, your new apk will be generated ad "android-sdk-test-project/app-debug.apk"

################# Known errors and fixes ########
#
# if any file in CustomBrowser changed unknowing, then git wont allow to checkout to your branch.
# To solve this problem run the following commands.
#   cd CustomBrowser
#   git checkout .
#   cd ..
#   .build.sh
#
# if the developer's android-studio has a different target version and your sdk could find the version then gradle will complain about missing file.
# to fix this please go to your androdi-sdk folder , open SDK manager and install required files.
#
##################  END ######################

#   a. CB MODE DEBUG - TRUE / FALSE
#   b. CB - Branch . Check out to the particular branch.
#   c. Build the project.
#   d. Copy the apk to parent folder.

#################### START ###################

# Constants.
APK_OUTPUT_PATH="app/build/outputs/apk/app-debug.apk"
CB_AAR_FILE_PATH="CustomBrowser/build/outputs/aar/CustomBrowser-release.aar"
CB_CLASS_FILE_PATH="app/build/intermediates/exploded-aar/android-sdk-test-project/CustomBrowser/unspecified/jars/classes.jar"
CB_MANIFEST_PATH="app/build/intermediates/exploded-aar/android-sdk-test-project/CustomBrowser/unspecified/AndroidManifest.xml"
CB_RESOURCE_PATH="app/build/intermediates/exploded-aar/android-sdk-test-project/CustomBrowser/unspecified/res"
SDK_AAR_FILE_PATH="PayU/build/outputs/aar/PayU-release.aar"
# default branchs
APP_BRANCH="version/2.1.1"
SDK_BRANCH="version/4.1.1"
SDK_UI_BRANCH="version/1.1.1"
CB_BRANCH="version/5.1.2"

# get user inputs .

read -p "Enter app branch name > " app_branch_name
app_branch_name=${app_branch_name:-$APP_BRANCH}

read -p "Enter sdk branch name > " sdk_branch_name
sdk_branch_name=${sdk_branch_name:-$SDK_BRANCH}

read -p "Enter sdk ui branch name > " sdk_ui_branch_name
sdk_ui_branch_name=${sdk_ui_branch_name:-$SDK_UI_BRANCH}

read -p "Enter cb branch name > " cb_branch_name
cb_branch_name=${cb_branch_name:-$CB_BRANCH}

read -p "Enter CB DEBUG Mode (true/false) >  " cb_debug_mode
cb_debug_mode=${cb_debug_mode:-true}

# lets print the data now:

echo -n "
        App Branch    : $app_branch_name
        SDK Branch    : $sdk_branch_name
        SDK UI Branch : $sdk_ui_branch_name
        CB Branch     : $cb_branch_name
        CB Debug      : $cb_debug_mode
        Do you want to continue (yes / no) :"
read user_confirmation

update_git(){
  git add .
  git add -u
  git stash
  git checkout master
  git pull --all
  git checkout $1
}

if [ "$user_confirmation" = "yes" ]; then

  # change this to app root directory
  cd android-sdk-test-project/
  update_git $app_branch_name
  # lets fetch sdk
  cd PayU/
  update_git $sdk_branch_name

  #lets fetch sdkui
  cd ../sdkui
  update_git $sdk_ui_branch_name

  #lets fetch cb
  cd ../CustomBrowser
  update_git $cb_branch_name

  # lets change the bank.java file debug mode according to the userput.
  sed -e "s/DEBUG = [a-z]*/DEBUG = $cb_debug_mode/g" src/com/payu/custombrowser/Bank.java > src/com/payu/custombrowser/Bank1.java
  echo "$(pwd)"
  rm src/com/payu/custombrowser/Bank.java
  mv src/com/payu/custombrowser/Bank1.java src/com/payu/custombrowser/Bank.java
  cd ..
  # we are good to go.

  # lets remove the old builds.
  if [ -d app/build ]
    then rm -fr app/build/
  fi

  if [ -d CustomBrowser/build ]
    then rm -fr CustomBrowser/build/
  fi

  # lets try to build the project using .gradle

  ./gradlew assembleDebug

  # lets remove the old apk and copy the new apk into outputs folder.
  if [ -d outputs ]
    then rm -fr outputs/*
  else
    mkdir outputs
  fi

  # lets copy the required files.
  cp $SDK_AAR_FILE_PATH outputs/
  cp $APK_OUTPUT_PATH outputs/
  cp $CB_AAR_FILE_PATH outputs/
  cp $CB_CLASS_FILE_PATH outputs/
  cp $CB_MANIFEST_PATH outputs/
  cp -r $CB_RESOURCE_PATH outputs/
fi
exit 0
