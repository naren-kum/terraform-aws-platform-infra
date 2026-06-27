aws_region   = "eu-west-2"
project_name = "terraform-aws-platform-infra"
environment  = "qa"

vpc_cidr = "10.20.0.0/16"

availability_zones = [
  "eu-west-2a",
  "eu-west-2b"
]

public_subnet_cidrs = [
  "10.20.1.0/24",
  "10.20.2.0/24"
]

private_app_subnet_cidrs = [
  "10.20.11.0/24",
  "10.20.12.0/24"
]

private_db_subnet_cidrs = [
  "10.20.21.0/24",
  "10.20.22.0/24"
]

app_port = 8080
db_port  = 5432

instance_type = "t3.micro"