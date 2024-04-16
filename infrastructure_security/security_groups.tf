
resource "aws_security_group" "infrastructure_sg" {
  name        = var.environment
  description = var.environment
  vpc_id      = var.vpc_id

  dynamic "ingress"{
    for_each = var.ingress
    content {
      from_port = ingress.value.port
      to_port = ingress.value.port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = var.namespace
    environment = var.environment
    RegTechnicalOwner = var.email

  }
}