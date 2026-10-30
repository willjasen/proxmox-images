#!/bin/sh

# Update the operating system
apt update -qq && DEBIAN_FRONTEND=noninteractive apt upgrade -y -qq;

# Install common tools
apt install apt-transport-https curl dnsutils git gh iputils-ping jq locate nano net-tools openssl ssh tmux wget -y -qq;

# Clean up no longer needed dependencies
apt autoremove -y -qq;

# End of the script
echo " The script is finished.";
