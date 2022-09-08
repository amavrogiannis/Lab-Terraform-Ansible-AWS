variable "ec2-name" {
    description = "Baptise your instance"
    type = string
    default = "ansible-bastion"
}

variable "ec2-type" {
  description = "Let's see what will be the cost?"
  type = string
  default = "t3.small"
}