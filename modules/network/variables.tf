variable "project_name" {
    description = "Name of the project"
    type = string
}

variable "environment" {
    description = "Environment name"
    type = string
}

variable "vpc_cidr" {
    description = "CIDR range for the VPC"
    type = string
}

variable "availability_zones" {
    description = "list of availability zones for subnet placement"
    type = list(string)
}

variable "public_subnet_cidrs" {
    description = "CIDR ranges for public subnets"
    type = list(string)
}

variable "private_app_subnet_cidrs" {
  description = "CIDR ranges for private application subnets"
  type        = list(string)
}

variable "private_db_subnet_cidrs" {
  description = "CIDR ranges for private database subnets"
  type        = list(string)
}