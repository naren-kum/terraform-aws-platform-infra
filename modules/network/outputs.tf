output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value = [
    for key in sort(keys(aws_subnet.public)) :
    aws_subnet.public[key].id
  ]
}

output "private_app_subnet_ids" {
  description = "Private app subnet IDs"
  value = [
    for key in sort(keys(aws_subnet.private_app)) :
    aws_subnet.private_app[key].id
  ]
}

output "private_db_subnet_ids" {
  description = "Private DB subnet IDs"
  value = [
    for key in sort(keys(aws_subnet.private_db)) :
    aws_subnet.private_db[key].id
  ]
}

output "alb_sg_id" {
  description = "ID of the alb sgs"
  value       = aws_security_group.alb_sg.id
}

output "app_sg_id" {
  description = "ID of the app sgs"
  value       = aws_security_group.app_sg.id
}

output "db_sg_id" {
  description = "ID of the db sgs"
  value       = aws_security_group.db_sg.id
}


output "aws_lb_tg_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.application_tg.arn
}

output "aws_lb_tg_name" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.application_tg.name
}

output "alb_arn" {
  description = "ARN of the public alb"
  value       = aws_lb.public_alb.arn
}

output "aws_listener_arn" {
  description = "ARN of the alb listener"
  value       = aws_lb_listener.application_lb_listener.arn
}

output "alb_dns_name" {
  value = aws_lb.public_alb.dns_name
}