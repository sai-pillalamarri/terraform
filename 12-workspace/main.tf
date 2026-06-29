resource "aws_instance" "roboshop" {
  ami                    = local.ami_id
  instance_type          = lookup(var.instance_types, local.environment)
  vpc_security_group_ids = [aws_security_group.roboshop_groups.id]

  tags = local.ec2_tag
}

resource "aws_security_group" "roboshop_groups" {
  name        = "${var.project_name}-${local.environment}-workspace"
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

  tags = local.sg_tag

}
