resource "aws_instance" "roboshop_instances" {
  #count                  = 4
  count                  = length(var.instances)
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.roboshop_security_groups[count.index].id, aws_security_group.roboshop_common_security_group.id]

  tags = {
    Name        = "${var.project}-${var.environment}-${var.instances[count.index]}"
    project     = "roboshop"
    environment = "dev"
  }
}

resource "aws_security_group" "roboshop_security_groups" {

  #count       = 4
  count       = length(var.instances)
  name        = "${var.project}-${var.environment}-${var.instances[count.index]}"
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

  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_security_group" "roboshop_common_security_group" {


  name        = "${var.project}-common"
  description = "common group for all instances"

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

  tags = {
    Name = "${var.project}-common"
  }

  lifecycle {
    create_before_destroy = true
  }

}


