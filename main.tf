provider "aws" {
  region                  = var.region
  shared_credentials_file = var.cred
}

resource "aws_vpc" "vpc" {
    cidr_block = var.cidr_block
    enable_dns_hostnames = true
    
    tags = {
        Name = "VPC190820"
    }

}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance
  key_name      = var.key_name
}

