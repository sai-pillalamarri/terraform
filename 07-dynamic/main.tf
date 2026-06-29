resource "aws_instance" "roboshop_instance" {
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.roboshop_security_groups.id]

  tags = {
    Name        = "roboshop-frontend"
    project     = "roboshop"
    environment = "dev"

  }
}

resource "aws_security_group" "roboshop_security_groups" {
  name        = "allow-terraform-dynamic"
  description = "Allow TLS inbound traffic and all outbound traffic"


  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] # tighten this to your IP in production

    }

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "allow-terraform-dynamic"
    project     = "roboshop"
    environment = "dev"
  }

}
