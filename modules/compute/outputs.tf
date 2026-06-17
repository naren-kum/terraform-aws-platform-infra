output "instance_id" {
  description = "ID of the EC2 Docker application host"
  value       = aws_instance.dev_app_host.id
}

output "instance_private_ip" {
  description = "Private IP of the EC2 Docker application host"
  value       = aws_instance.dev_app_host.private_ip
}

output "target_group_attachment_id" {
  description = "Target group attachment ID for the EC2 Docker application host"
  value       = aws_lb_target_group_attachment.attach_dev_app_host.id
}

output "ec2_ssm_role_name" {
  description = "IAM role name used by the EC2 instance for SSM access"
  value       = aws_iam_role.ec2_ssm_role.name
}

output "ec2_instance_profile_name" {
  description = "IAM instance profile attached to the EC2 instance"
  value       = aws_iam_instance_profile.ec2_ssm_profile.name
}