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

