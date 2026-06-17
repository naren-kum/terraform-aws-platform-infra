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