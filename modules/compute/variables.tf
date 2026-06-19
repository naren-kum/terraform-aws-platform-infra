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

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"

  validation {
    condition     = can(regex("^[a-z][0-9][a-z]?\\.[a-z0-9]+$", var.instance_type))
    error_message = "instance_type must be a valid-looking EC2 instance type, for example t3.micro or t3.small."
  }
}