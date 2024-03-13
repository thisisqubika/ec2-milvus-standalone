variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "m5.xlarge"  # Adjust as necessary
}

variable "ami" {
  description = "Amazon Machine Image ID for the EC2 instance"
  type        = string
  default     = "ami-079db87dc4c10ac91"  # Ensure this is the correct AMI for your region and requirements
}

# agregar mas tamano de Disc

variable "key_name" {
  description = "The name of the EC2 Key Pair"
  type        = string
  default = "ec2-milvus-standalone"
  # No default provided; should be specified at runtime or via terraform.tfvars for security reasons
}


