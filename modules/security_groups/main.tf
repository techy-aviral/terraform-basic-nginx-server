resource "aws_security_group" "my_sg" {
  name        = "my-sg"
  description = "Allow SSH and HTTP traffic"
  vpc_id = var.vpc_id
  tags = {
    Name = "my-sg"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

output "security_group_id" {
  value = aws_security_group.my_sg.id
}