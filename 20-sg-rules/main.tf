#Bastion 
resource "aws_security_group_rule" "bastion_internet_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = local.bastion_sg_id
}

resource "aws_security_group_rule" "bastion_internet_all_traffic" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = local.bastion_sg_id
}

#MongoDB
resource "aws_security_group_rule" "mongodb_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = data.aws_ssm_parameter.bastion_sg_id.value # local.bastion_sg_id you can use anything
  security_group_id        = local.mongodb_sg_id
}

resource "aws_security_group_rule" "mongodb_catalogue" {
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  source_security_group_id = local.catalogue_sg_id
  security_group_id        = local.mongodb_sg_id
}

resource "aws_security_group_rule" "mongodb_user" {
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  source_security_group_id = local.user_sg_id
  security_group_id        = local.mongodb_sg_id
}

#Redis
resource "aws_security_group_rule" "redis_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id        = local.redis_sg_id
}

resource "aws_security_group_rule" "redis_user" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.user_sg_id
  security_group_id        = local.redis_sg_id
}

resource "aws_security_group_rule" "redis_cart" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.cart_sg_id
  security_group_id        = local.redis_sg_id
}

#MySQL
resource "aws_security_group_rule" "mysql_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id        = local.mysql_sg_id
}

#Rabbitmq
resource "aws_security_group_rule" "rabbitmq_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id        = local.rabbitmq_sg_id
}

#Backend_ALB
resource "aws_security_group_rule" "backend_alb_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id        = local.backend_alb_sg_id
}

