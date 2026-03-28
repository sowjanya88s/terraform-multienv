resource "aws_instance" "my_instance" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  tags = {
    Name = "terraform-tfvars-${var.environment}"
    terraform = "true"
  }
}

resource "aws_security_group" "my_sg" {
  name        = "terraform-vpc"
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
    Name = "terraform-tfvars-${var.environment}"
  }

}