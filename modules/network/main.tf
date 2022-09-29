resource "aws_vpc" "main" {
  
  enable_dns_hostnames = true
  enable_dns_support   = true
  cidr_block           = cidrsubnet(var.cidr_vpc, 0, 0)

  tags = {
    "Name" = "${var.vpc_name}"
    "Project"   = "${var.project-name}"
    "Contact"   = "${var.project-poc}"
    "Terraform" = "Yes"
  }
}
