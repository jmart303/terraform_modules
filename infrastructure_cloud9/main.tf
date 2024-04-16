resource "aws_cloud9_environment_ec2" "dev_ide" {
  instance_type = "t2.micro"
  name          = "jmart_dev_ide"
  automatic_stop_time_minutes = 30
  description = "IDE Development Environment"
  tags = {
    Owner = var.email
    Service = "development IDE"
  }
}
