resource "aws_instance" "roboshop" {

  ami                    = data.aws_ami.image.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allw-terraform.id]

  tags = {
    Name        = "${var.project}-${var.environment}-tfvars"
    project     = var.project
    environment = var.environment
  }

}

resource "aws_security_group" "allw-terraform" {
  name        = "${var.project}-${var.environment}-tfvars"
  description = "Allow TLS inbound traffic and all outbound traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # tighten this to your IP in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project}-${var.environment}-tfvars"
    project     = var.project
    environment = var.environment
  }

}
