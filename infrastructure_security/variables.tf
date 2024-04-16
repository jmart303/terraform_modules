
variable "environment" {
  description = "instance environment"
}

variable "vpc_id" {
  description = "The VPC ID"
}

variable "cidr_block_pub" {
  description = "private access"
}


variable "aws_security_group_id" {
  description = "Security Group ID"
}

variable "email" {
  description = "email of owner for tags"

}
variable "namespace" {
}

variable "ingress" {
  type = map(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}