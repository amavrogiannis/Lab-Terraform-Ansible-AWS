module "network-vpc" {
  source = "./modules/network"
}

data "aws_ami" "AmazonLinux" {
  most_recent = true
    owners = ["amazon"]
    
    filter {
      name = "name"
      values = ["amzn2-ami-hvm-*-gp2"]
    }

    filter {
      name = "root-device-type"
      values = ["ebs"]
    }

    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }

    filter {
      name = "architecture"
      values = ["x86_64"]
    }
}

# resource "aws_network_interface" "main" {
#   subnet_id = module.network-vpc.subnet_id
#   private_ips = [module.network-vpc.cidr_block]

#   tags = {
#     "Name" = "${var.name}-nic-ansible-demo"
#   }
# }

resource "aws_ebs_volume" "main" {
  availability_zone = "${var.region}a"
  size              = 20
  type = "gp2"

  tags = {
    Name = "${var.name}-volume"
  }
}