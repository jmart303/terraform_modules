

//resource "aws_vpc" "my-vpc" {
//  cidr_block       = var.cidr_block_vpc
//  instance_tenancy = "default"
//
//  tags = {
//    Name  = var.namespace
//    Owner = var.email
//  }
//}

//resource "aws_subnet" "subnet" {
//  vpc_id            = aws_vpc.my-vpc.id
//  cidr_block        = var.subnet_block_1
////  cidr_block        = aws_vpc.mytest-vpc.cidr_block
//  availability_zone = var.availability_zone
//
//  tags = {
//    Name  = var.namespace
//    Owner = var.email
//  }
//}
//
//resource "aws_subnet" "subnet2" {
//  vpc_id            = aws_vpc.my-vpc.id
//  cidr_block        = var.subnet_block_2
//  availability_zone = var.availability_zone
//
//  tags = {
//    Name  = var.namespace
//    Owner = var.email
//  }
//}

//resource "aws_network_interface" "test1" {
//  subnet_id       = aws_subnet.subnet.id
//  private_ips     = ["10.30.5.50"]
//  security_groups = [var.aws_security_group_id]
//
//  attachment {
//    instance     = var.aws_instance_id
//    device_index = 1
//  }
//}
//
//resource "aws_network_interface" "test2" {
//  subnet_id       = aws_subnet.subnet2.id
//  private_ips     = ["10.30.4.25"]
//  security_groups = [var.aws_security_group_id]
//
//    attachment {
//  instance     = var.aws_instance_id
//      device_index = 1
//    }
//}

//resource "aws_network_acl" "tst-acl" {
//  vpc_id = var.vpc_id
//  subnet_ids = [var.aws_subnet_id_1, var.aws_subnet_id_2]
//  ingress {
//    protocol   = "tcp"
//    rule_no    = 100
//    action     = "allow"
//    cidr_block = "0.0.0.0/0"
//    from_port  = 443
//    to_port    = 443
//  }

//  ingress {
//    protocol   = "-1"
//    rule_no    = 200
//    action     = "allow"
//    cidr_block = "0.0.0.0/0"
//    from_port  = 0
//    to_port    = 0
//  }
//
//  egress {
//    protocol   = "-1"
//    rule_no    = 300
//    action     = "allow"
//    cidr_block = "0.0.0.0/0"
//    from_port  = 0
//    to_port    = 0
//  }
//
//  tags = {
//    Name = var.namespace
//  }
//}


// USE THE DEFAULT VPC
resource "aws_subnet" "subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = var.namespace
    Owner = var.email
  }
}


