output "aws_instance_t2" {
  value = aws_instance.linux_t2
}

# output "aws_instance_m4" {
#   value = aws_instance.linux_m4
# }

output "ec2_sg" {
  value = aws_security_group.ec2_sg.id
}