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

variable "environment" {
  type    = string
  default = "development"
}