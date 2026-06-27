variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment name"
  type        = string

  validation {
    condition     = contains(["dev", "qa", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, qa, staging, prod."
  }
}

variable "vpc_cidr" {
  description = "CIDR range for the VPC"
  type        = string

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "vpc_cidr must be a valid CIDR block, for example 10.10.0.0/16."
  }
}

variable "availability_zones" {
  description = "list of availability zones for subnet placement"
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) > 0
    error_message = "At least one availability must be provided."
  }
}

variable "public_subnet_cidrs" {
  description = "CIDR ranges for public subnets"
  type        = list(string)

  validation {
    condition     = length(var.public_subnet_cidrs) > 0
    error_message = "At least one public subnet CIDR must be provided."
  }

  validation {
    condition     = length(var.public_subnet_cidrs) == length(var.availability_zones)
    error_message = "The number of public subnet CIDRs must match the number of availability zones."
  }
}

variable "private_app_subnet_cidrs" {
  description = "CIDR ranges for private application subnets"
  type        = list(string)

  validation {
    condition     = length(var.private_app_subnet_cidrs) > 0
    error_message = "At least one private app subnet CIDR must be provided."
  }

  validation {
    condition     = length(var.private_app_subnet_cidrs) == length(var.availability_zones)
    error_message = "The number of private app subnet CIDRs must match the number of availability zones."
  }
}

variable "private_db_subnet_cidrs" {
  description = "CIDR ranges for private database subnets"
  type        = list(string)

  validation {
    condition     = length(var.private_db_subnet_cidrs) > 0
    error_message = "At least one private db subnet subnet CIDR must be provided."
  }

  validation {
    condition     = length(var.private_db_subnet_cidrs) == length(var.availability_zones)
    error_message = "The number of private db subnet CIDRs must match the number of availability zones."
  }
}

variable "app_port" {
  description = "App port for app sg"
  type        = string
}

variable "db_port" {
  description = "db port for db sg"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"

  validation {
    condition     = can(regex("^[a-z][0-9][a-z]?\\.[a-z0-9]+$", var.instance_type))
    error_message = "instance_type must be a valid-looking EC2 instance type, for example t3.micro or t3.small."
  }
}