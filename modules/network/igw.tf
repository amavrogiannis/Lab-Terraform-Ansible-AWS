resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.main.id

  depends_on = [
    aws_subnet.main_public
  ]

  tags = {
    "Project"   = "${var.project-name}"
    "Contact"   = "${var.project-poc}"
    "Terraform" = "Yes"
  }
}

resource "aws_route_table" "main" {
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
    "Project"   = "${var.project-name}"
    "Contact"   = "${var.project-poc}"
    "Terraform" = "Yes"
  }
}

resource "aws_route_table_association" "main" {
  count          = length(var.cidr_public)
  route_table_id = element(aws_route_table.main[*].id, count.index)
  subnet_id      = element(aws_subnet.main_public[*].id, count.index)
}
