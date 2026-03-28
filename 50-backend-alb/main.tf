resource "aws_lb" "backend_alb" {
  name               = "${var.project}-${var.environment}" 
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  subnets            = local.private_subnet_ids
  
  # keeping it as false, just to delete using terraform while practice
  enable_deletion_protection = false

  tags = merge(
    {
        Name = "${var.project}-${var.environment}"
    },
    local.common_tags
  )
}

resource "aws_lb_listener" "backend_alb" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "<h1>Hi, Response is from HTTP Backend ALB</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "backend_alb" {
    name = "*.backend_alb-${var.project}-${var.environment}"
    allow_overwrite = true
    type = "A"
    zone_id = var.zone_id
    alias {
      zone_id = aws_lb.backend_alb.zone_id
      name = aws_lb.backend_alb.dns_name
      evaluate_target_health = true 
    }
}