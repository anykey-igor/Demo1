resource "aws_route53_record" "jenkins" {
  zone_id    = var.r53_zone
  name       = var.r53_zone_name_jmaster
  type       = var.r53_zone_type
  ttl        = var.r53_zone_ttl
  records    = [aws_instance.jenkins.public_ip]
  depends_on = [aws_instance.jenkins]
}

resource "aws_route53_record" "prod" {
  zone_id    = var.r53_zone
  name       = var.r53_zone_name_prod
  type       = var.r53_zone_type
  ttl        = var.r53_zone_ttl
  records    = [aws_instance.prod.public_ip]
  depends_on = [aws_instance.prod]
}