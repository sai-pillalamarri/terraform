locals {
  project_name  = "roboshop"
  instance_type = "t3.micro"
  ami_id        = data.aws_ami.practice_image.id
  common_tags = {
    project     = local.project_name
    environment = var.environment
  }

  ec2_tags = merge(
    {
      Name = "${local.project_name}-${var.environment}-frontened"
    },
    local.common_tags

  )

  sg_tags = merge(
    {
      Name = "${local.project_name}-${var.environment}-demo"
    },
    local.common_tags

  )
}
