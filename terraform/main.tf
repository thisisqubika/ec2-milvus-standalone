terraform {
  backend "s3" {
    bucket  = "ec2-milvus-standalone-state-testing"
    key     = "terraform.tfstate"
    encrypt = true
    region  = "us-east-1"
  }
}


provider "aws" {
  region = var.region
}

resource "aws_security_group" "milvus_sg_testing" {
  name        = "milvus-sg"
  description = "Security group for Milvus deployment with Docker"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 19530
    to_port     = 19530
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "milvus_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  security_groups        = [aws_security_group.milvus_sg_testing.name]
  user_data              = file("${path.module}/../create-milvus.sh")
  
# tamano de disco
  root_block_device {
      volume_size = 30
  }

  #  "${file("create-milvus.sh")}"

  tags = {
    Name = "Milvus-central-db-testing"
  }
}

