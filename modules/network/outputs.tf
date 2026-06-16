output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "private_app_subnet_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private_app[*].id
}

output "private_db_subnet_ids" {
  description = "IDs of the private db subnets"
  value       = aws_subnet.private_db[*].id
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

