output "bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.app_bucket.bucket
}

output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.network.public_subnet_ids
}

output "private_app_subnet_ids" {
  description = "IDs of the private app subnets"
  value       = module.network.private_app_subnet_ids
}

output "private_db_subnet_ids" {
  description = "IDs of the private db subnets"
  value       = module.network.private_db_subnet_ids
}

output "alb_sg_id" {
  description = "ID of the alb sgs"
  value       = module.network.alb_sg_id
}

output "app_sg_id" {
  description = "ID of the app sgs"
  value       = module.network.app_sg_id
}

output "db_sg_id" {
  description = "ID of the db sgs"
  value       = module.network.db_sg_id
}

output "aws_lb_tg_arn" {
  description = "ARN of the target group"
  value       = module.network.aws_lb_tg_arn
}

output "aws_lb_tg_name" {
  description = "ARN of the target group"
  value       = module.network.aws_lb_tg_name
}

output "alb_arn" {
  description = "ARN of the public alb"
  value       = module.network.alb_arn
}

output "aws_listener_arn" {
  description = "ARN of the alb listener"
  value       = module.network.aws_listener_arn
}

output "alb_dns_name" {
  value = module.network.alb_dns_name
}

output "app_host_instance_id" {
  value = module.compute.instance_id
}

output "app_host_private_ip" {
  value = module.compute.instance_private_ip
}