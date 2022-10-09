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

########## START | EIP and NAT Gateway ###########
########## Description: No need to use EIP and NAT GW for the Ansible Demo. 
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
########## END | EIP and NAT Gateway ###########

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
  
  # route {
  #   cidr_block = "0.0.0.0/0"
  #   nat_gateway_id = "${aws_nat_gateway.main.id}"
  # }

  tags = {
    "Name"      = "RT-Private-${var.vpc_name}"
    "Project"   = "${var.project-name}"
    "Contact"   = "${var.project-poc}"
    "Terraform" = "Yes"
  }

# depends_on = [
#   aws_nat_gateway.main
# ]
}

resource "aws_route_table_association" "public" {
  count = length(var.cidr_public)

  subnet_id      = element(aws_subnet.main_public.*.id, count.index)
  route_table_id = element(aws_route_table.public.*.id, count.index)
}

resource "aws_route_table_association" "private" {
  count = length(var.cidr_private)

  subnet_id      = element(aws_subnet.main_private.*.id, count.index)
  route_table_id = aws_route_table.private.id
}