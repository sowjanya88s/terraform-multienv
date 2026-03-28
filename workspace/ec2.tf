resource "aws_instance" "my_instance" {
  ami           = local.ami_id
  instance_type = lookup(var.instance_type, local.environment)
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  tags = {
    Name = "roboshop-ec2-${local.environment}"
    terraform = "true"
  }
}

resource "aws_security_group" "my_sg" {
  name        = "roboshop-${local.environment}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "roboshop-sg-${local.environment}"
  }
}