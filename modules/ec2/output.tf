output "instance_arn" {
    value = aws_instance.ec2_instance.arn
  
}
output "instance_ami" {
    value = aws_instance.ec2_instance.ami
  
}
output "instance_state" {
    value = aws_instance.ec2_instance.instance_state
  
}
