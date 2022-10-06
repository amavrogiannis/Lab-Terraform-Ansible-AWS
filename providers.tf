terraform {
  required_version = "~>1.3.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
}


provider "aws" {
  region  = local.region
  profile = local.aws_profile
}
