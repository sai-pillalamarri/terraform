resource "aws_instance" "roboshop_instances" {
  for_each               = var.instances
  ami                    = each.value.ami_id
  instance_type          = each.value.instance_type
  vpc_security_group_ids = [aws_security_group.roboshop_security_groups[each.key].id, aws_security_group.roboshop_common_security_group.id]

  tags = {
    Name        = "${var.project}-${var.environment}-${each.key}"
    project     = "roboshop"
    environment = "dev"
  }
}

resource "aws_security_group" "roboshop_security_groups" {

  for_each    = var.instances
  name        = "${var.project}-${var.environment}-${each.key}"
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
    Name = "${var.project}-${var.environment}-${each.key}"
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


