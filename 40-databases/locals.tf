locals { 
    
    common_tags = {
    Project     = "roboshop"
    Terraform   = "true"
    Environment = "dev"

  }
  
  database_subnet_id = split("," , data.aws_ssm_parameter.database_subnet_ids.value)[0]
  ssh_password = data.aws_ssm_parameter.ssh_password.value
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
}