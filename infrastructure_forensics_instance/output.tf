output "instance_ips" {
  value = [
    aws_instance.forensic_tools.*.public_ip]
}
