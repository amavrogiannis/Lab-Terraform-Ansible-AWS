output "ec2-web" {
  value = aws_instance.server-web.id
}

output "ec2-web-hostname" {
  value = aws_instance.server-web.host_id
}

output "ec2-apps" {
  value = aws_instance.server-apps.id
}

output "ec2-apps-hostname" {
  value = aws_instance.server-apps.host_id
}