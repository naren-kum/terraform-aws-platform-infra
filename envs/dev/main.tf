resource "aws_s3_bucket" "app_bucket" {
  bucket = "${var.project_name}-${var.environment}-naren"

  tags = {
    Name        = "${var.project_name}-${var.environment}-bucket"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}