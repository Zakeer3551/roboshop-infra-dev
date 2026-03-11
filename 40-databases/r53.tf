resource "aws_route53_record" "mongodb" {
  zone_id = var.zone_id
  name    = "mongodb-${var.environment}.${var.domain_name}"
  type    = "A"
  ttl     = "1"
  records = "mongodb-${var.environment}.${var.domain_name}"
  allow_overwrite = true
}

resource "aws_route53_record" "redis" {
  zone_id = var.zone_id
  name    = "redis-${var.environment}.${var.domain_name}"
  type    = "A"
  ttl     = "1"
  records = "redis-${var.environment}.${var.domain_name}"
  allow_overwrite = true
}

resource "aws_route53_record" "user" {
  zone_id = var.zone_id
  name    = "user-${var.environment}.${var.domain_name}"
  type    = "A"
  ttl     = "1"
  records = "user-${var.environment}.${var.domain_name}"
  allow_overwrite = true
}


