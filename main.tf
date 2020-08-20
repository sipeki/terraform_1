provider "aws" {
  region                  = var.region
  shared_credentials_file = var.cred
}

module "sipeki_vpc" {
  source = "./VPC"

}

module "sipeki_instance" {
  source    = "./EC2"
  subnet_id = module.sipeki_vpc.subnet_a_id
  sg_ids    = module.sipeki_sg.sg_ids

}

module "sipeki_sg" {
  source = "./SG"
  vpc_id = module.sipeki_vpc.vpc_id

}