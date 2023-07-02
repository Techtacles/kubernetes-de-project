resource "aws_instance" "ec2_instance" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  monitoring = var.ec2_monitoring

  tags = {
    Name = var.ec2_tag_name
  }
}
