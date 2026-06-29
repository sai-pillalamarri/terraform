resource "aws_instance" "roboshop_instances" {
  ami                    = data.aws_ami.practice_image.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.roboshop_security_groups.id]

  tags = var.instance_tags
}

resource "aws_security_group" "roboshop_security_groups" {
  name        = var.security_group_name
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "-1"
    cidr_blocks = var.cidr

  }

  tags = var.sg_tags

}

output "test_varaiable_precedenec" {
  value = var.test

}
