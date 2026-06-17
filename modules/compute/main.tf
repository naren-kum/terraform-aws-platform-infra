resource "aws_instance" "dev_app_host" {
  ami           = "ami-07c06c9f04a3f051f"
  instance_type = "t3.micro"

  vpc_security_group_ids      = [var.security_group_id]
  subnet_id                   = var.subnet_id # Using public subnet temporarily for Docker bootstrap without NAT.
  user_data                   = file("${path.module}/install_docker.sh")
  associate_public_ip_address = true

  tags = {
    Name        = "${var.project_name}-${var.environment}-ec2"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}

resource "aws_lb_target_group_attachment" "attach_dev_app_host" {
  target_group_arn = var.target_group_arn
  target_id        = aws_instance.dev_app_host.id
  port             = 8080
}