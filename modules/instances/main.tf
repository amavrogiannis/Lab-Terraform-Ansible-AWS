resource "aws_instance" "main" {
    ami = data.aws_ami.AmazonLinux.id
    instance_type = var.ec2-type

    tags = {
      "Name" = "${var.ec2-name}"
    }
}