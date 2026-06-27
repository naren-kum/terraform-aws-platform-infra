terraform {
  required_version = ">= 1.10.0"

  backend "s3" {
    bucket       = "naren-terraform-state-361769572669-eu-west-2"
    key          = "envs/dev/terraform.tfstate"
    region       = "eu-west-2"
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}