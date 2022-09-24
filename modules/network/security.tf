# Parent security group
resource "aws_security_group" "public" {
  name        = "${var.vpc_name}-security-group"
  description = "Allow Web traffic into Ansible Demo"
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.main_sg
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      cidr_blocks = ingress.value
      protocol    = "tcp"
      description = "Terraform managed rule"
    }
  }

  tags = {
    "Project"   = "${var.project-name}"
    "Contact"   = "${var.project-poc}"
    "Terraform" = "Yes"
  }
}
