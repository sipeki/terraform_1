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

variable "subnet_id" {
  description = "subnet ID for EC2"

}

variable "sg_ids" {
  description = "security group ID for EC2"

}
