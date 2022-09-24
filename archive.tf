# THIS IS ARCHIVE FILE. WHERE YOU CAN FIND UNUSED CODE BLOCKS. 

###########################################
# ./modules/instances/config.tf (DELETED) #
###########################################

# resource "aws_ebs_volume" "bastion-volume" {
#     encrypted = false
#     size = var.volume_size
#     type = "gp2"
#     availability_zone = data.aws_availability_zones.available.names[0]

#     tags = {
#       "Project" = "${var.project-name}"
#       "Contact" = "${var.project-poc}"
#       "Terraform" = "Yes"
#     }
# }

#############################################
# ./modules/instances/main.tf (STILL THERE) #
#############################################

# resource "aws_volume_attachment" "ec2_volume" {
#   device_name = "/dev/xvda"
#   volume_id = aws_ebs_volume.bastion-volume.id
#   instance_id = aws_instance.main.id
# }

###########################
# ./main.tf (STILL THERE) #
###########################

# module "network" {
#   source = "./modules/network"
# }

# resource "aws_instance" "bastion" {
#   ami = data.aws_ami.AmazonLinux.id
#   instance_type = var.ec2-type
#   # vpc_security_group_ids = module.network.security_group_id
#   associate_public_ip_address = true 
#   subnet_id = module.network.subnet_id
#   availability_zone = "${var.region}a"
#   key_name = "ec2-ansible-demo"

# network_interface {
#   network_interface_id = aws_network_interface.main.id
#   device_index = 0
# }

# root_block_device {
#   volume_type = aws_ebs_volume.main.type
#   volume_size = aws_ebs_volume.main.size
# }

# user_data = <<EOF
#   #!/bin/bash
#   yum update -y && yum upgrade -y
#   sudo amazon-linux-extras install ansible2 -y
# EOF

# tags = {
#   "Name" = "${var.name}-server"
# }
# depends_on = [
#   module.network.vpc_id
# ]
# }