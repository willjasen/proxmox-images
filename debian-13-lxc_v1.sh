#!/bin/sh

# Update the operating system
apt-get update -qq >/dev/null && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -qq >/dev/null;

# Install common tools that are not already installed
common_tools="apt-transport-https bind9-dnsutils curl git gh htop iputils-ping jq locate nano net-tools openssl rsync ssh sudo tmux wget"
missing_tools=""
for package in $common_tools; do
    if [ "$(dpkg-query -W -f='${db:Status-Status}' "$package" 2>/dev/null)" != "installed" ]; then
        missing_tools="$missing_tools $package"
    fi
done

if [ -n "$missing_tools" ]; then
    # Intentional word splitting passes each missing package as an apt-get argument.
    apt-get install $missing_tools -y -qq >/dev/null;
else
    echo "Common tools are already installed; skipping installation."
fi

# Install Tailscale only when it is not already available
if command -v tailscale >/dev/null 2>&1; then
    echo "Tailscale is already installed; skipping installation."
else
    curl -fsSL https://tailscale.com/install.sh | sh;
fi

# Clean up no longer needed dependencies
apt-get autoremove -y -qq >/dev/null;
