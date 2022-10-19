variable "project-name" {
  description = "Name your project."
  type        = string
  default     = "IaaC-Guild-AWS-Ansible"
}

variable "project-poc" {
  description = "Who is the Point-of-Contact on the project?"
  type        = string
  default     = "alex.mavrogiannis"
}

variable "ec2-name" {
  description = "Baptise your instance"
  type        = string
  default     = "ansible-ec2"
}

variable "ec2-type" {
  description = "Let's see what will be the cost?"
  type        = string
  default     = "t3.small"
}

variable "ec2-key_name" {
  description = "Enter your key name - which points to your PEM key file to sign in."
  type        = string
  default     = "ec2-ansible-demo"
}

variable "volume_size" {
  description = "Enter the volume size you for your bastion"
  type        = number
  default     = 8
}

# Reference from the modules

variable "vpc_security_group_ids" {}
variable "vpc_public_subnet_id" {}
variable "vpc_private_subnet_id" {}