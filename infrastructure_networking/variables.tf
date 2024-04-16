
variable "namespace" {
  description = "Service Naming"
}

//variable "vpc_id" {
//  description = "The VPC ID"
//}

variable "availability_zone" {
  description = "The VPC ID"
}

variable "cidr_block_vpc" {
  description = "vpc block"
}

variable "subnet_block_1" {
  description = "subnet 1 block"
}

variable "subnet_block_2" {
  description = "subnet 2 block"
}

variable "owner" {
  description = "Instance Owner"
}
variable "email" {
  description = "email of owner for tags"
}

variable "aws_security_group_id" {
  default = ""
}

variable "aws_instance_id" {
  default = ""
}

variable "vpc_id" {
  description = "The VPC ID"
}

variable "cidr_block" {
  description = "subnet block"
}
