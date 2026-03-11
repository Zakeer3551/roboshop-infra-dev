locals { 
    
    common_tags = {
    Project     = "roboshop"
    Terraform   = "true"
    Environment = "dev"

  }
  
  database_subnet_id = split("," , data.aws_ssm_parameter.database_subnet_ids.value)[0]
  ssh_password = data.aws_ssm_parameter.ssh_password.value
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
  redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value
  mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value

  mysql_role = join("-", [for name in ["${var.project}", "${var.var.environment}", "mysql" ] : title(name)])
  /* mysql_role = join("-"", 
    [for name in ["${var.project}", "${var.var.environment}", "mysql" ] : title(name)]
    ) */

  mysql_policy_name = join("", [
            for name in ["${var.project}","${var.environment}", "mysql"] : title(name)
        ])

}