locals {

  common_tags = {
    Project     = "roboshop"
    Terraform   = "true"
    Environment = "dev"

  }

  backend_sg_id = data.aws_ssm_parameter.backend_sg_id.value
  private_subnet_ids = split(",",  data.aws_ssm_parameter.private_subnet_id.value)
}