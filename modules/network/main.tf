resource "aws_vpc" "main" {
  cidr_block                       = var.cidr_block
  enable_dns_hostnames             = true
  enable_dns_support               = true

  tags = {
    Terraform   = "true"
    Owner       = "A.Mavrogiannis"
    Environment = "${var.environment}"
    Name        = "${var.vpc_name}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name" = "${var.vpc_name}"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "${cidrsubnet(aws_vpc.main.cidr_block, 4, 1)}"

  tags = {
    Terraform   = "true"
    Owner       = "A.Mavrogiannis"
    Environment = "${var.environment}"
    Name        = "${var.vpc_name}"
  }

  # depends_on = [
  #   aws_internet_gateway.public-igw
  # ]
}

# resource "aws_internet_gateway" "public-igw" {
#   vpc_id = aws_vpc.main.id
#   tags = {
#     Terraform   = "true"
#     Owner       = "A.Mavrogiannis"
#     Environment = "${var.environment}"
#     Name        = "${var.vpc_name}"
#   }
# }