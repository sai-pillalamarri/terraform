resource "aws_instance" "roboshop_instances" {
  ami                    = local.ami_id
  instance_type          = local.instance_type
  vpc_security_group_ids = [aws_security_group.roboshop_security_groups.id]

  tags = local.ec2_tags

  provisioner "local-exec" {
    command = "echo the server Ip address is ${self.private_ip}"

  }

  provisioner "local-exec" {
    command = "echo instance is cretaed"

  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo instance is destroyed"

  }

  connection {
    type     = "ssh"
    host     = self.public_ip
    user     = "ec2-user"
    password = "DevOps321"

  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]

  }
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

  tags = local.sg_tags

}

