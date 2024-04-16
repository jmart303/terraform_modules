output "aws_autoscaling_group_instance_id" {
  value = aws_autoscaling_group.infra-asg.id
}

//output "autoscaling_group_id" {
//  description = "The autoscaling group id"
//  value       = element(concat(aws_autoscaling_group.infra-asg.*.id, [""]), 0)
//}