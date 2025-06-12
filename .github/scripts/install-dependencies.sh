
#!/bin/bash

set -e

echo "Updating package list..."
sudo apt-get update

echo "Installing Python..."
sudo apt-get install -y python3 python3-pip

echo "Installing Java (OpenJDK 17)..."
sudo apt-get install -y openjdk-17-jdk

echo "Installing Docker..."
# Remove older versions if any
sudo apt-get remove -y docker docker-engine docker.io containerd runc || true

# Install using the official Docker repository
sudo apt-get install -y \
     ca-certificates \
     curl \
     gnupg \
     lsb-release

# Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
     sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the repository
echo \
   "deb [arch=$(dpkg --print-architecture) \
   signed-by=/etc/apt/keyrings/docker.gpg] \
   https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable" | \
   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add current user to docker group (optional, for non-root usage)
sudo usermod -aG docker $USER

echo "All dependencies installed successfully!"
