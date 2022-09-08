variable "environment" {
  description = "which environment is it you are deploying to?"
  type        = string
  default     = "development"
}

variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "vpc_name" {
  type    = string
  default = "ansible-demo-vpc"
}

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "whitelist" {
  type = string
  default = "147.12.183.153/32"
}

variable "ingress_rules" {
  description = "list of ingress rules"
  type = list(string)
  default = [ 
    
   ]
}
