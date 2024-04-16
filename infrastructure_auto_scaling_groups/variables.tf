
variable "environment" {
  description = "instance environment"
}

variable "set_hostname" {
  description = "Whether or not to change the instance hostname"
  default = "true"
}

variable "namespace" {
  description = "Service Naming"
}

variable "public_key_path" {
  description = "The absolute path on disk to the SSH public key."
}

variable "private_key_path" {
  description = "The absolute path on disk to the SSH private key."
}

variable "ami" {
  description = "AWS Image"
}

variable "instance_type" {
  description = "AWS Instance type"
}

variable "aws_subnet_id" {
  description = "Subnet ID"
}

variable "aws_security_group_id" {
  default = ""
}

variable "region" {
  default = ""
}

variable "email" {
}