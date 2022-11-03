output "ec2-web" {
  value = aws_instance.server-web.id
}

output "ec2-web-hostname" {
  value = aws_instance.server-web.host_id
}

output "ec2-docker" {
  value = aws_instance.server-docker.id
}

output "ec2-docker-hostname" {
  value = aws_instance.server-docker.host_id
}
