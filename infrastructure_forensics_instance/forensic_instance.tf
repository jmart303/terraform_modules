
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

resource "aws_volume_attachment" "forensic_tools_att" {
  device_name  = "/dev/sdh"
  volume_id    = var.volume_id
  instance_id = aws_instance.forensic_tools.id
  skip_destroy = true
}

resource "aws_instance" "forensic_tools" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.aws_subnet_id
  vpc_security_group_ids      = [var.aws_security_group_id]
  associate_public_ip_address = true
  user_data                   = data.template_file.instance_config.template
  key_name                    = aws_key_pair.infra-key.id
  security_groups             = [var.aws_security_group_id]
  iam_instance_profile        = var.iam_instance_profile


  tags = {
    Name     = var.environment
    Owner    = var.email
  }
}

