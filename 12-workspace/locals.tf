locals {
  environment = terraform.workspace
  ami_id      = data.aws_ami.image.id

  common_tags = {
    project     = var.project_name
    environment = local.environment
  }

  ec2_tag = merge(
    {
      Name = "${var.project_name}-${local.environment}-workspace"
    },
    local.common_tags
  )

  sg_tag = merge(
    {
      Name = "${var.project_name}-${local.environment}-workspace"
    },
    local.common_tags
  )
}
