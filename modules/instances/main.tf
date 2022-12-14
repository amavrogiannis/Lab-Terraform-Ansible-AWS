resource "aws_instance" "server-web" {

  ami               = data.aws_ami.AmazonLinux.id
  instance_type     = var.ec2-type
  availability_zone = data.aws_availability_zones.available.names[0]

  subnet_id              = var.vpc_public_subnet_id[0].id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  key_name               = var.ec2-key_name

  ebs_block_device {
    delete_on_termination = true
    device_name           = "/dev/xvda"
    volume_size           = 25
    volume_type           = "gp2"
  }

  # user_data = <<EOF
  # #!/bin/bash
  # sudo yum update -y
  # sudo amazon-linux-extras install httpd -y
  # sudo systemctl start httpd
  # sudo systemctl enable httpd
  # EOF

  tags = {
    "Name"      = "${var.ec2-name}-webserver"
    "Project"   = "${var.project-name}"
    "Contact"   = "${var.project-poc}"
    "AnsibleRole" = "Apache"
    "Terraform" = "Yes"
  }
}

resource "aws_instance" "server-docker" {

  ami               = data.aws_ami.AmazonLinux.id
  instance_type     = var.ec2-type
  availability_zone = data.aws_availability_zones.available.names[0]

  subnet_id              = var.vpc_public_subnet_id[0].id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  key_name               = var.ec2-key_name

  ebs_block_device {
    delete_on_termination = true
    device_name           = "/dev/xvda"
    volume_size           = 25
    volume_type           = "gp2"
  }

  # user_data = <<EOF
  # #!/bin/bash
  # yum update -y
  # amazon-linux-extras install docker
  # service docker start
  # usermod -a -G docker ec2-user
  # chkconfig docker on
  # EOF

  tags = {
    "Name"      = "${var.ec2-name}-docker"
    "Project"   = "${var.project-name}"
    "Contact"   = "${var.project-poc}"
    "AnsibleRole" = "Docker"
    "Terraform" = "Yes"
  }
}
