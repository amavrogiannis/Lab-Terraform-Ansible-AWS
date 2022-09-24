output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_name" {
  value = var.vpc_name
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "public-sub" {
  value = aws_subnet.main_public
}


output "private-sub" {
  value = aws_subnet.main_private
}

output "security_groups_public" {
  value = aws_security_group.public.id
}