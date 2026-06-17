resource "aws_s3_bucket" "app_bucket" {
  bucket = "${var.project_name}-${var.environment}-naren"

  tags = {
    Name        = "${var.project_name}-${var.environment}-bucket"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}

module "network" {
  source = "../../modules/network"

  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = var.vpc_cidr

  availability_zones       = var.availability_zones
  public_subnet_cidrs      = var.public_subnet_cidrs
  private_app_subnet_cidrs = var.private_app_subnet_cidrs
  private_db_subnet_cidrs  = var.private_db_subnet_cidrs
  app_port                 = var.app_port
  db_port                  = var.db_port
}

module "compute" {
  source = "../../modules/compute"

  project_name      = var.project_name
  environment       = var.environment
  subnet_id         = module.network.private_app_subnet_ids[0]
  security_group_id = module.network.app_sg_id
  target_group_arn  = module.network.aws_lb_tg_arn
}