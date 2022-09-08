terraform {
  backend "s3" {
    bucket         = "terraform-vms-ansible-demo-backend"
    key            = "prefix/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-vms-ansible-demo-backend"
    encrypt        = true
    profile        = "and"
  }
}