resource "aws_instance" "main" {

  ami               = data.aws_ami.AmazonLinux.id
  instance_type     = var.ec2-type
  availability_zone = data.aws_availability_zones.available.names[0]

  subnet_id              = var.vpc_public_subnet_id[0].id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  key_name               = var.ec2-key_name

  user_data = <<EOF
  #!/bin/bash
  sudo su
  yum update -y && yum upgrade -y
  EOF

  ebs_block_device {
    delete_on_termination = true
    device_name           = "/dev/xvda"
    volume_size           = 25
    volume_type           = "gp2"
  }

  tags = {
    "Name"      = "${var.ec2-name}"
    "Project"   = "${var.project-name}"
    "Contact"   = "${var.project-poc}"
    "Terraform" = "Yes"
  }
}

