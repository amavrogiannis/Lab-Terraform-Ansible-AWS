# Parent security group
resource "aws_security_group" "public" {
  name        = "${var.vpc_name}-security-group"
  description = "Allow Web traffic into Ansible Demo"
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.ingress_roles
    content {
      description = ingress.value["description"]
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = tolist(ingress.value["cidr_blocks"])
    }
  }

  dynamic "egress" {
    for_each = var.egress_roles
    content {
      from_port   = egress.value["from_port"]
      to_port     = egress.value["to_port"]
      protocol    = egress.value["protocol"]
      cidr_blocks = tolist(egress.value["cidr_blocks"])
    }
  }

  tags = {
    "Project"   = "${var.project-name}"
    "Contact"   = "${var.project-poc}"
    "Terraform" = "Yes"
  }
}
