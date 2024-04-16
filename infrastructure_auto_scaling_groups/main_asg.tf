
resource "aws_key_pair" "infra-key" {
  key_name   = "${var.environment}-${var.namespace}"
  public_key = var.public_key_path
}

resource "aws_launch_configuration" "infra-lc" {
  image_id = var.ami
  instance_type = var.instance_type
  key_name = aws_key_pair.infra-key.id
  security_groups = [
    var.aws_security_group_id]
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }

  root_block_device {
    volume_size = 85
  }

  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 85
    volume_type = "gp2"
    encrypted = true
    delete_on_termination = true
  }
}

resource "aws_placement_group" "security" {
  name = var.environment
  strategy = "spread"
}

resource "aws_autoscaling_group" "infra-asg" {
  name = var.environment
  launch_configuration = aws_launch_configuration.infra-lc.id
  placement_group = aws_placement_group.security.id
  vpc_zone_identifier = [var.aws_subnet_id]
  max_size = "7"
  min_size = "1"
  desired_capacity = "1"

//  force_delete = true
//  termination_policies = ["OldestInstance"]
  tag {
    key = "Owner"
    value = var.email
    propagate_at_launch = true
  }
  tag {
    key = "Name"
    value = var.environment
    propagate_at_launch = true
  }
}