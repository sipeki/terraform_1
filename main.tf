provider "aws" {
  region                  = var.region
  shared_credentials_file = var.cred
}

module "sipeki_vpc" {
  source = "./VPC"

}

module "sipeki_instance" {
  source = "./EC2"

}