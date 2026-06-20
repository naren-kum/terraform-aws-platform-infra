locals {
  name_prefix = "${var.project_name}-${var.environment}"

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }

  public_subnets = {
    for index, cidr in var.public_subnet_cidrs :
    format("public-%02d", index + 1) => {
    cidr_block        = cidr
    availability_zone = var.availability_zones[index]
    subnet_number     = index + 1
   }
 }

  private_app_subnets = {
    for index, cidr in var.private_app_subnet_cidrs :
    format("private-app-%02d", index + 1) => {
    cidr_block        = cidr
    availability_zone = var.availability_zones[index]
    subnet_number     = index + 1
   }
 }

  private_db_subnets = {
    for index, cidr in var.private_db_subnet_cidrs :
    format("private-db-%02d", index + 1) => {
    cidr_block        = cidr
    availability_zone = var.availability_zones[index]
    subnet_number     = index + 1
   }
 }
}