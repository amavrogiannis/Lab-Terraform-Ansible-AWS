resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.main.id

  depends_on = [
    aws_subnet.main_public
  ]

  tags = {
    "Name"      = "IGW-${var.vpc_name}"
    "Project"   = "${var.project-name}"
    "Contact"   = "${var.project-poc}"
    "Terraform" = "Yes"
  }
}

# resource "aws_eip" "main" {
#   vpc = true
#   tags = {
#     "Name" = "NAT-${var.vpc_name}"
#     "Project"   = "${var.project-name}"
#     "Contact"   = "${var.project-poc}"
#     "Terraform" = "Yes"
#   }
# }

# resource "aws_nat_gateway" "main" {
#   connectivity_type = "public"
#   allocation_id = aws_eip.main.id
#   subnet_id = aws_subnet.main_public[0].id

#   depends_on = [
#     aws_internet_gateway.public
#   ]

#   tags = {
#     "Name" = "NAT-${var.vpc_name}"
#     "Project"   = "${var.project-name}"
#     "Contact"   = "${var.project-poc}"
#     "Terraform" = "Yes"
#   }
# }

resource "aws_route_table" "public" {
  count  = length(var.cidr_public)
  vpc_id = aws_vpc.main.id

  route {
    gateway_id = aws_internet_gateway.public.id
    cidr_block = "0.0.0.0/0"
  }

  depends_on = [
    aws_internet_gateway.public
  ]

  tags = {
    "Name"      = "RT-Public-${var.vpc_name}"
    "Project"   = "${var.project-name}"
    "Contact"   = "${var.project-poc}"
    "Terraform" = "Yes"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name"      = "RT-Private-${var.vpc_name}"
    "Project"   = "${var.project-name}"
    "Contact"   = "${var.project-poc}"
    "Terraform" = "Yes"
  }
}

resource "aws_route_table_association" "main" {
  count          = length(var.cidr_public)
  route_table_id = element(aws_route_table.public[*].id, count.index)
  subnet_id      = element(aws_subnet.main_public[*].id, count.index)
}
