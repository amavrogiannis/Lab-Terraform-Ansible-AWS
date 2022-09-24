output "ec2-bastion" {
  value = aws_instance.main.id
}

output "ec2-hostname" {
  value = aws_instance.main.host_id
}