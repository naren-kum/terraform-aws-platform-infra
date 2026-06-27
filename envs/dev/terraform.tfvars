aws_region   = "eu-west-2"
project_name = "terraform-aws-platform-infra"
environment  = "dev"

vpc_cidr = "10.10.0.0/16"

availability_zones = [
  "eu-west-2a",
  "eu-west-2b"
]

public_subnet_cidrs = [
  "10.10.1.0/24",
  "10.10.2.0/24"
]

private_app_subnet_cidrs = [
  "10.10.11.0/24",
  "10.10.12.0/24"
]

private_db_subnet_cidrs = [
  "10.10.21.0/24",
  "10.10.22.0/24"
]

app_port = 8080
db_port  = 5432

instance_type = "t3.micro"