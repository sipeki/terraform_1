variable "cidr_block" {
  default     = "192.168.0.0/16"
  description = "the cider blcok VPC"
}

variable "sn_cidr_block" {
  default     = "192.168.1.0/24"
  description = "the cider block for Sub net"
}

variable "open_internet" {
  default = "0.0.0.0/0"
}