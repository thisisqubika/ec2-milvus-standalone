# path to pem private key:
# /Users/miguelelhaiek/.pems/ec2-milvus-standalone-testing.pem



#!/bin/bash
# Update the system
sudo apt-get update
# Install Docker
sudo apt-get install -y docker.io
# Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker
# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
