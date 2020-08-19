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

  tags = {
    Name = "Subnet for VPC190820"

  }

}

resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "VPC GW"
  }
}


resource "aws_route_table" "vpc_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.open_internet
    gateway_id = aws_internet_gateway.vpc_igw.id
  }

  tags = {
    Name = "RT for VPC190820"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet_a.id
  route_table_id = aws_route_table.vpc_rt.id
}

resource "aws_security_group" "sg_web" {
  name        = var.sg_web_name
  description = var.sg_web_description
  vpc_id      = aws_vpc.vpc.id

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.value
      protocol    = "tcp"
      to_port     = port.value
      cidr_blocks = [var.open_internet]

    }
  }

  egress {
    from_port   = var.outbound_port
    protocol    = "-1"
    to_port     = var.outbound_port
    cidr_blocks = [var.open_internet]
  }


}
resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.subnet_a.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg_web.id]

  tags = {

    name = "EC2 for VPC190820"

  }
}


