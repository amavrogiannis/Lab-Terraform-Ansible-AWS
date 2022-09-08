# Parent security group
resource "aws_security_group" "admin" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name" = var.vpc_name
  }
}

# Inbound rules
resource "aws_security_group_rule" "network-ssh" {
  description = "Allow default admin service"
  security_group_id = aws_security_group.admin.id
  type = "ingress"
  from_port        = 22
  to_port          = 22
  protocol         = "tcp"
  cidr_blocks      = [aws_subnet.public.cidr_block]
#  ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]

  depends_on = [
    aws_vpc.main
  ]
}

resource "aws_security_group_rule" "network-http" {
  description = "Allow incoming HTTP"
  security_group_id = aws_security_group.admin.id
  type = "ingress"
  from_port        = 80
  to_port          = 80
  protocol         = "tcp"
  cidr_blocks      = [aws_subnet.public.cidr_block]
#  ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]

  depends_on = [
    aws_vpc.main
  ]
}

resource "aws_security_group_rule" "network-https" {
  description = "Allow incoming HTTPS"
  security_group_id = aws_security_group.admin.id
  type = "ingress"
  from_port        = 443
  to_port          = 443
  protocol         = "tcp"
  cidr_blocks      = [aws_subnet.public.cidr_block]
#  ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]

  depends_on = [
    aws_vpc.main
  ]
}

# Outbount Rules
resource "aws_security_group_rule" "network-outbound" {
  type = "egress"
  security_group_id = aws_security_group.admin.id
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]

  depends_on = [
    aws_vpc.main
  ]
}
