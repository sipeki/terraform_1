variable "region" {
  description = "This variable states the region for the AWS environment"
  default     = "eu-west-1"
}

variable "instance" {
  description = "This variable states the instance type for your EC2"
  default     = "t2.micro"
}

variable "ami" {
  description = "This variable states the ami for your EC2"
  default     = "ami-07ee42ba0209b6d77"
}

variable "key" {
  description = "This variable states the key name for your EC2"
  default     = "simon"
}

variable "cred" {
  description = "This variable states the credential location"
  default     = "~/.aws/credentials"
}


