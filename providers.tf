terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.28.0"
    }
  }
}

provider "local" {

}

provider "aws" {
  region  = "eu-west-1"
  profile = "and"
}

locals {
  region = "eu-west-1"
}