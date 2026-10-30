#!/bin/sh

# Update the operating system
apt update -qq && DEBIAN_FRONTEND=noninteractive apt upgrade -y -qq;

# Install common tools
apt install apt-transport-https curl dnsutils git gh htop iputils-ping jq locate nano net-tools openssl rsync ssh sudo tmux wget -y -qq;

# Install Tailscale only when it is not already available
if command -v tailscale >/dev/null 2>&1; then
    echo "Tailscale is already installed; skipping installation."
else
    curl -fsSL https://tailscale.com/install.sh | sh;
fi

# Clean up no longer needed dependencies
apt autoremove -y -qq;

# End of the script
echo " The script is finished.";
