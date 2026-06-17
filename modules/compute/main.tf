resource "aws_instance" "dev_app_host" {
  ami                         = "ami-07c06c9f04a3f051f"
  instance_type               = "t3.micro"
  iam_instance_profile        = aws_iam_instance_profile.ec2_ssm_profile.name
  vpc_security_group_ids      = [var.security_group_id]
  subnet_id                   = var.subnet_id # Using public subnet temporarily for Docker bootstrap without NAT.
  user_data                   = file("${path.module}/install_docker.sh")
  associate_public_ip_address = false

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

resource "aws_iam_role" "ec2_ssm_role" {
  name = "${var.project_name}-${var.environment}-ec2-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name        = "${var.project_name}-${var.environment}-ec2-ssm-role"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_role_policy_attachment" "ec2_ssm_core" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ec2_ssm_profile" {
  name = "${var.project_name}-${var.environment}-ec2-ssm-profile"
  role = aws_iam_role.ec2_ssm_role.name

  tags = {
    Name        = "${var.project_name}-${var.environment}-ec2-ssm-profile"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}