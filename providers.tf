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

provider "local" {

}

provider "aws" {
  region  = "eu-central-1"
  profile = "and"
}
