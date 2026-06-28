resource "aws_instance" "roboshop_instance" {

  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_from_myIp.id]

  tags = merge(
    var.common_tags,
    {
      Name      = "roboshop-instance"
      Component = "roboshop"
    }
  )

}

resource "aws_security_group" "allow_from_myIp" {

  name        = "allow-myip"
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

  tags = merge(
    var.common_tags,
    {
      Name      = "allow-myip"
      Component = "roboshop"
    }
  )


}
