provider "aws" {
  region                  = var.region
  shared_credentials_file = var.cred
}

resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "VPC190820"
  }

}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.sn_cidr_block
  availability_zone = data.aws_availability_zones.available.names[0]

}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "r" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.sn_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }


}

resource "aws_main_route_table_association" "a" {
  vpc_id      = aws_vpc.vpc.id
  route_table_id = aws_route_table.r.id
}


resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.subnet_a.id
  associate_public_ip_address = true
}


