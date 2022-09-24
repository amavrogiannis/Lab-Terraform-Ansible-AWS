resource "aws_subnet" "main_private" {
  count             = length(var.cidr_private) # I need to create 2 private subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.cidr_private, count.index) # cidrsubnet(var.cidr_private, 4, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  depends_on = [
    aws_vpc.main
  ]

  tags = {
    "Project"   = "${var.project-name}"
    "Contact"   = "${var.project-poc}"
    "Terraform" = "Yes"
  }
}

resource "aws_subnet" "main_public" {
  count                   = length(var.cidr_public) # I need to create 1 private subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.cidr_public, count.index) # cidrsubnet(var.cidr_public, 4, count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  depends_on = [
    aws_vpc.main
  ]

  tags = {
    "Project"   = "${var.project-name}"
    "Contact"   = "${var.project-poc}"
    "Terraform" = "Yes"
  }
}