#!/bin/bash

RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`

clear 
echo
echo "${RED}mac_bootstrap for $(whoami) on $(hostname -s)${RESET}"
echo
echo "${RED}ENTER YOUR PASSWORD WHEN PROMPTED${RESET}"
echo

# check if Xcode Command Line Tools are installed
# return code is 0 if they are, 2 if they are not
xcode-select -p
if [ $? == 2 ]
then
  echo
	echo "${RED}  Installing Xcode Command Line Tools ...${RESET}"
	echo "${RED}  ---------------------------------------${RESET}"
	echo
	echo "${RED}CLICK INSTALL IN THE WINDOW THAT OPENS${RESET}"
	echo
	#need to wait for this
	xcode-select --install
else
	echo "${GREEN}  Xcode Command Line Tools already installed.${RESET}"
	echo	
fi

if [ "$(whoami)" != "$(stat -f '%Su' /usr/local/bin/)" ]
then
	echo
	echo "${RED}  Fix ownership of /usr/local/ ...${RESET}"
	echo "${RED}  --------------------------------${RESET}"
	echo
	sudo chown -R $(whoami):admin /usr/local
else
	echo "${GREEN}  Owner of /usr/local/bin is already $(whoami).${RESET}"
	echo
fi

if [ ! -f "/opt/chef/bin/chef-client" ]
then
	echo
	echo "${RED}  Installing Chef ...${RESET}"
	echo "${RED}  -------------------${RESET}"
	echo
	curl -L https://omnitruck.chef.io/install.sh | sudo bash
else
	echo "${GREEN}  Chef already installed.${RESET}"
	echo
fi

if [ ! -f "/opt/chef/embedded/bin/berks" ]
then
	echo
	echo "${RED}  Installing Berkshelf for Chef ...${RESET}"
	echo "${RED}  ---------------------------------${RESET}"
	echo
	sudo /opt/chef/embedded/bin/gem install --no-rdoc --no-ri berkshelf
	ln -s /opt/chef/embedded/bin/berks /usr/local/bin
else
	echo "${GREEN}  Berkshelf already installed.${RESET}"
	echo
fi
