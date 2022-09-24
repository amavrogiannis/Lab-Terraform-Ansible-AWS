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

variable "main_sg" {
  description = "Allowed ports to Network VPC"
  type        = any
  default = {
    "22"  = ["147.12.183.153/32"]
    "80"  = ["0.0.0.0/0"]
    "433" = ["0.0.0.0/0"]
  }
}
