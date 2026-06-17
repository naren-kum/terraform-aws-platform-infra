variable "project_name" {
    description = "Name of the project"
    type = string
}

variable "environment" {
    description = "Environment name"
    type = string
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to attach to the EC2 instance"
  type        = string
}

variable "target_group_arn" {
  description = "Target group ARN where the EC2 instance will be registered"
  type        = string
}