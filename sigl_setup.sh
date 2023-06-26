#!/bin/bash

echo "Setting up SIGL codebase..."

echo "Installing SPADE..."
#sudo add-apt-repository -y ppa:openjdk-r/ppa
#sudo apt-get update
#sudo apt-get install -y openjdk-11-jdk
#sudo apt-get install -y auditd bison clang cmake curl flex fuse git ifupdown libaudit-dev libfuse-dev linux-headers-`uname -r` lsof pkg-config unzip uthash-dev

git clone https://github.com/zeerakb1/SPADE.git
cd SPADE/
git checkout version-process

./configure
make

bin/installPostgres
sudo chmod ug+s `which auditctl`
sudo chmod ug+s `which iptables`
sudo chmod ug+s `which kmod`
sudo chown root bin/spadeAuditBridge
sudo chmod ug+s bin/spadeAuditBridge

# Define the file path and words to search for
#file_path="/etc/audisp/plugins.d/af_unix.conf"
#search_words="no"  # Add the words you want to search for
#replace_word="yes"  # The word you want to replace with

# Check if the file exists
#if [ ! -f "$file_path" ]; then
#  echo "File not found: $file_path"
#  exit 1
#fi

#Replacing word
#sudo sed -i "s/\b$search_word\b/$replace_word/g" "$file_path"

#echo "Word replacement complete."
