provider "aws" {
  region                  = var.region
  shared_credentials_file = var.cred
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance
  key_name      = var.key_name
}

