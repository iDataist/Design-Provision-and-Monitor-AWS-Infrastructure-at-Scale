resource "aws_instance" "linux_t2" {
  ami                    = var.aws_ami
  count                  = 4
  instance_type          = "t2.micro"
  subnet_id              = var.public_subnet_ids
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "Udacity T2"
  }
}

# resource "aws_instance" "linux_m4" {
#   ami                    = var.aws_ami
#   count                  = 2
#   instance_type          = "m4.large"
#   subnet_id              = var.public_subnet_ids
#   vpc_security_group_ids = [aws_security_group.ec2_sg.id]

#   tags = {
#     Name = "Udacity M4"
#   }
# }


resource "aws_security_group" "ec2_sg" {
  name   = "ec2_sg"
  vpc_id = var.vpc_id

  ingress {
    description = "web port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "ssh port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2_sg"
  }
}