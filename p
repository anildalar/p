#!/bin/bash

# Exit on any error
set -e

echo "🔄 Updating system packages..."
sudo apt update -y

echo "📦 Installing required packages..."
sudo apt install -y git gcc make libproxychains4 libssl-dev

echo "📁 Cloning proxychains-ng repository..."
git clone https://github.com/rofl0r/proxychains-ng.git

cd proxychains-ng

echo "⚙️ Configuring and building..."
./configure --prefix=/usr --sysconfdir=/etc
make

echo "📥 Installing proxychains-ng..."
sudo make install
sudo make install-config

echo "✅ proxychains-ng installed successfully!"
echo "📄 Default config at: /etc/proxychains.conf"

echo "💡 Example usage:"
echo "    proxychains4 curl http://example.com"
