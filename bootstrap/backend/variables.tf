variable "aws_region" {
  description = "AWS region for the Terraform backend resources"
  type        = string
}

variable "state_bucket_name" {
  description = "Name of the S3 bucket used for Terraform remote state"
  type        = string
}