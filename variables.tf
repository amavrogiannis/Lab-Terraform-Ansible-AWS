variable "ami-id" {
  type    = string
  default = "amzn2-ami-hvm-*-x86_64-ebs"
}

variable "name" {
  type    = string
  default = "ansible-demo"
}

variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "ec2-type" {
  type    = string
  default = "t3.small"
}

variable "ip-address" {
  type    = string
  default = "147.12.183.153/32"
}

variable "ip-whitelist" {

  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = string
    description = string
  }))

  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_block  = "147.12.183.153/32"
      description = "ssh to instance"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_block  = "147.12.183.153/32"
      description = "http to view webapp"
    },
  ]
}

variable "availability-zone" {
  type    = string
  default = "eu-west-1"

}