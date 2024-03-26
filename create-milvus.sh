# path to pem private key:
# /Users/miguelelhaiek/.pems/ec2-milvus-standalone-testing.pem
# ssh -i "/Users/miguelelhaiek/.pems/ec2-milvus-standalone-testing.pem" ec2-user@ec2-18-234-47-2.compute-1.amazonaws.com


#!/bin/bash
# Update the system
sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo chmod 666 /var/run/docker.sock
mkdir milvus
cd milvus
# copiar docker-compose del local adentro de la EC2
vim docker-compose.yaml
vim custom_milvus.yaml

# instalar docker compose
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
docker compose version

cd milvus
docker compose up -d