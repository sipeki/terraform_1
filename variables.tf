variable "region" {
  description = "This variable states the region for the AWS environment"
  default     = "eu-west-1"
}

variable "instance" {
  description = "This variable states the instance type for your EC2"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "This variable states the ami for your EC2"
  default     = "ami-07ee42ba0209b6d77"
}

variable "key_name" {
  description = "This variable states the key name for your EC2"
  default     = "simon"
}

variable "cred" {
  description = "This variable states the credential location"
  default     = "~/.aws/credentials"
}

variable "cidr_block" {
  default     = "192.168.0.0/16"
  description = "the cider blcok VPC"
}

variable "sn_cidr_block" {
  default     = "192.168.1.0/24"
  description = "the cider block for Sub net"
}

