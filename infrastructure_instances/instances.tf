
data "template_file" "instance_config" {
    template = var.template
  vars = {
    environment  = var.environment
    set_hostname = var.set_hostname
  }
}


resource "aws_key_pair" "infra-key" {
  key_name   = "${var.environment}-${var.namespace}"
  public_key = var.public_key_path
}
//
//resource "aws_volume_attachment" "net_tools_att" {
//  device_name  = "/dev/sdh"
//  volume_id    = aws_ebs_volume.tools_vg.id
//  instance_id  = aws_instance.net_tools.id
//  skip_destroy = false
//}
//
//resource "aws_ebs_volume" "tools_vg" {
//  availability_zone = "us-east-1c"
//  size              = 15
//  encrypted         = true
//
//  tags = {
//    Name  = var.environment
//    Owner = var.email
//  }
//}

resource "aws_instance" "generic" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.aws_subnet_id
  vpc_security_group_ids      = [var.aws_security_group_id]
  associate_public_ip_address = true
  user_data                   = data.template_file.instance_config.template
  key_name                    = aws_key_pair.infra-key.id
  security_groups             = [var.aws_security_group_id]
  iam_instance_profile        = var.iam_instance_profile
#  lifecycle {
#    prevent_destroy = true
#    create_before_destroy = true
#  }

  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 85
    volume_type = "gp2"
    encrypted = true
    delete_on_termination = false
  }

  tags = {
    Name     = var.environment
    Owner    = var.email
  }
}