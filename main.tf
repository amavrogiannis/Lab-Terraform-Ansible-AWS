module "network" {
  source     = "./modules/network"
  cidr_block = "10.10.0.0/16"
}

resource "aws_instance" "bastion" {
  ami = data.aws_ami.AmazonLinux.id
  instance_type = var.ec2-type
  # vpc_security_group_ids = module.network.security_group_id
  associate_public_ip_address = true 
  subnet_id = module.network.subnet_id
  availability_zone = "${var.region}a"
  key_name = "ec2-ansible-demo"
  
  # network_interface {
  #   network_interface_id = aws_network_interface.main.id
  #   device_index = 0
  # }

  root_block_device {
    volume_type = aws_ebs_volume.main.type
    volume_size = aws_ebs_volume.main.size
  }

  user_data = <<EOF
    #!/bin/bash
    yum update -y && yum upgrade -y
    sudo amazon-linux-extras install ansible2 -y
  EOF

  tags = {
    "Name" = "${var.name}-server"
  }
  depends_on = [
    module.network.vpc_id
  ]
}