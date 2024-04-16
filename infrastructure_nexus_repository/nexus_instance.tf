
data "template_file" "nexus_config" {
  template = var.template

  vars = {
    environment = var.environment
    set_hostname = var.set_hostname
  }
}

resource "aws_key_pair" "nexus-key" {
  key_name   = "${var.environment}-${var.namespace}"
  public_key = var.public_key_path
}

resource "aws_volume_attachment" "nexus_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.nexus_vg.id
  instance_id = aws_instance.nexus_repo.id
  skip_destroy = false
}

resource "aws_ebs_volume" "nexus_vg" {
  availability_zone = var.availability_zone
  size              = 105
  encrypted = true

  tags = {
    Name =var.environment
    Owner = var.email
  }
}

resource "aws_instance" "nexus_repo" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = var.aws_subnet_id
  vpc_security_group_ids = [var.aws_security_group_id]
  associate_public_ip_address = true
  user_data = data.template_file.nexus_config.rendered
  key_name = aws_key_pair.nexus-key.id
  security_groups = [var.aws_security_group_id]

  provisioner "file" {
    source      = "packages/nexus-3.30.1-01-unix.tar.gz"
    destination = "/tmp/nexus-3.30.1-01-unix.tar.gz"

    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = var.private_key_path
      host = self.public_ip
    }
  }

  tags = {
    Name = var.environment
    Owner = var.email
  }
}

output "instance_ips" {
  value = [
    aws_instance.nexus_repo.*.public_ip]
}