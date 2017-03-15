#!/bin/bash

# Bash script to bootstrap a Mac into Chef and install all dependencies
# Tested on OS X 10.11 only

# Define colours for terminal output
RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`

clear 
echo
echo "${RED}mac_bootstrap for $(whoami) on $(hostname -s)${RESET}"
echo
echo "${RED}ENTER YOUR PASSWORD WHEN PROMPTED${RESET}"

# check if Xcode Command Line Tools are installed
# return code is 0 if they are, 2 if they are not, supress any output
xcode-select -p &> /dev/null
if [ $? == 2 ]
then
  echo
  echo "${RED}  Installing Xcode Command Line Tools ...${RESET}"
  echo "${RED}  ---------------------------------------${RESET}"
  
  # Taken from https://github.com/timsutton/osx-vm-templates/blob/master/scripts/xcode-cli-tools.sh
  # create the placeholder file that's checked by CLI updates' .dist code
  # in Apple's SUS catalog
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
  # find the CLI Tools update
  PROD=$(softwareupdate -l | grep "\*.*Command Line" | head -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')
  # install it
  softwareupdate -i "${PROD}" --verbose
  rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
else
  echo
  echo "${GREEN}  Xcode Command Line Tools already installed.${RESET}"  
fi

if [ ! -f "/opt/chef/bin/chef-client" ]
then
  echo
  echo "${RED}  Installing Chef ...${RESET}"
  echo "${RED}  -------------------${RESET}"
  curl -L https://omnitruck.chef.io/install.sh | sudo bash
else
  echo
  echo "${GREEN}  Chef already installed.${RESET}"
fi

if [ ! -f "/opt/chef/embedded/bin/berks" ]
then
  echo
  echo "${RED}  Installing Berkshelf for Chef ...${RESET}"
  echo "${RED}  ---------------------------------${RESET}"
  sudo /opt/chef/embedded/bin/gem install --no-rdoc --no-ri berkshelf
  sudo ln -s /opt/chef/embedded/bin/berks /usr/local/bin
else
  echo
  echo "${GREEN}  Berkshelf already installed.${RESET}"
fi

if [ ! -d "/opt/mac_bootstrap/.git" ]
then
  echo
  echo "${RED}  Cloning Git Repo ...${RESET}"
  echo "${RED}  --------------------${RESET}"
  cd /opt && sudo git clone https://github.com/mikemoate/mac_bootstrap.git
else
  echo
  echo "${RED}  Updating existing Git Repo ...${RESET}"
  echo "${RED}  ------------------------------${RESET}"
  cd /opt/mac_bootstrap && sudo git checkout master && sudo git pull
fi

echo
echo "${RED}  Vendoring cookbooks with Berkshelf ...${RESET}"
echo "${RED}  --------------------------------------${RESET}"

cd /opt/mac_bootstrap && sudo berks vendor cookbooks

echo
echo "${RED}  Running chef-client in local mode ...${RESET}"
echo "${RED}  -------------------------------------${RESET}"

cd /opt/mac_bootstrap && sudo chef-client -z -r mac_bootstrap::default -j ./users/$(whoami).json
