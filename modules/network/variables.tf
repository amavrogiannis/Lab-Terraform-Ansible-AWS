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

variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "vpc_name" {
  type    = string
  default = "ansible-demo-vpc"
}

variable "cidr_vpc" {
  description = "This will be your MAIN VPC IPv4 Address"
  type        = string
  default     = "10.0.0.0/16"
}


# cidrsubnet(prefix, newbits, netnum)
variable "cidr_public" {
  description = "This is your Public subnet IPv4 Address"
  type        = list(string)
  default = [
    "10.0.10.0/24"
  ]
}

variable "cidr_private" {
  description = "This is your Private subnet IPv4 Address"
  type        = list(string)
  default = [
    "10.0.100.0/24",
    "10.0.110.0/24"
  ]
}

variable "map_public_ip_on_launch" {
  type    = bool
  default = "true"
}

variable "environment" {
  description = "which environment is it you are deploying to?"
  type        = string
  default     = "development"
}

variable "ingress_roles" {
  description = "Allowed ports inbound traffic"
  type        = list(any)
  default = [
    {
      description      = "Terraform managed rule"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      self = false
    },
    {
      description      = "Terraform managed rule"
      from_port        = 8080
      to_port          = 8080
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      self = false
    },
    {
      description      = "Terraform managed rule"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      self = false
    },
    {
      description      = "Terraform managed rule"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["34.249.64.26/32"]
      ipv6_cidr_blocks = ["::/0"]
      self = true
    },
    {
      description      = "Terraform managed rule"
      from_port        = -1
      to_port          = -1
      protocol         = "icmp"
      cidr_blocks      = ["34.249.64.26/32"]
      ipv6_cidr_blocks = ["::/0"]
      self = true
    }
  ]
}

variable "egress_roles" {
  description = "Allow outbound traffic"
  type        = list(any)
  default = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "all"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]
}